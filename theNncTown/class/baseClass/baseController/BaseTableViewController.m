

#import "BaseTableViewController.h"

@interface BaseTableViewController ()
{
    
}
@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configeSubView];
}
- (void)configeSubView{
    _tableView = [[UITableView alloc] initWithFrame:self.viewFrame style:self.tableViewStyle];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = COLOR(237, 238, 239, 1.0);
    _tableView.separatorStyle = self.tableViewCellSeparatorStyle;
    if (self.headerView != nil) {
        _tableView.tableHeaderView = self.headerView;
    }
    if (self.footerView != nil) {
        _tableView.tableFooterView = self.footerView;
    }
    [self.view addSubview:_tableView];
}
#pragma mark - section
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{}

#pragma mark - row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.dataResources.count;
}
#pragma mark - cellHeight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellHeight;
}
#pragma mark - footerHeight
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return self.cellFootHeight;
}
#pragma mark - headerHeight
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.cellHeadHeight;
}
#pragma mark - cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseTableViewCell *cell =  [NSClassFromString(self.cellStr) setCellWithTableView:tableView];
    
    cell.tag = indexPath.row;
    cell.selectionStyle = self.tableViewCellselectionStyle;
    
    [cell retureClickCellIndex:^(NSInteger index) {
        self.cellClick(index);
    }];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseTableViewCell *cel = (BaseTableViewCell *)cell;
    cel.baseModel = self.dataResources[indexPath.row];
    
}
#pragma makr - didSelect
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (!self.viewFromHeader) {
        return self.viewFromHeader;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (!self.viewFromFooter) {
        return self.viewFromFooter;
    }
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - 头部View到0 顺畅滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.isScroll) {
        if (scrollView == _tableView)
        {
            CGFloat sectionHeaderHeight = self.cellHeadHeight;
            if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
                scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
            } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
                scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            }
        }
    }
}
- (void)returnCellClick:(CellClick)block{
    self.cellClick = block;
}
@end

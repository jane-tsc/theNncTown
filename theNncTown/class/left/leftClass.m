//
//  leftClass.m
//  theNncTown
//
//  Created by lanren on 16/12/1.
//  Copyright © 2016年 com.nnctown. All rights reserved.
//

#import "leftClass.h"
#import "leftModel.h"
#import "leftCell.h"
@interface leftClass ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *leftView;
@property (nonatomic, strong) NSArray *leftArr;
@end

@implementation leftClass

- (NSArray *)leftArr{
    if (_leftArr == nil) {
        _leftArr = [leftModel shareModel];
    }
    return _leftArr;
}

- (UITableView *)leftView{
    if (_leftView == nil) {
        _leftView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, MainHeight)];
        _leftView.dataSource = self;
        _leftView.delegate = self;
        _leftView.backgroundColor = [UIColor clearColor];
        _leftView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_leftView];
    }
    return _leftView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.leftArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return GetWidth(80);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    leftCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[leftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    leftModel *model = self.leftArr[indexPath.row];
    cell.leftContents.text = model.leftContent;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.leftView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

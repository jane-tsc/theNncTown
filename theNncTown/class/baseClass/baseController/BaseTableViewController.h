// ***********************************
//
//
//              且行且珍惜
//
//
// ***********************************

#import <UIKit/UIKit.h>
#import "BaseClassViewController.h"
#import "BaseTableViewCell.h"
#import "SubClassViewController.h"
typedef void (^CellClick)(NSInteger index);

@interface BaseTableViewController : SubClassViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) CGRect viewFrame;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat cellHeadHeight;
@property (nonatomic, assign) CGFloat cellFootHeight;
@property (nonatomic, assign) BOOL isScroll;
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, assign) UITableViewCellSeparatorStyle tableViewCellSeparatorStyle;
@property (nonatomic, assign) UITableViewCellSelectionStyle tableViewCellselectionStyle;


@property (nonatomic, copy)   NSString *cellStr;
@property (nonatomic, strong) NSArray *dataResources;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, strong) UIView *viewFromHeader;
@property (nonatomic, strong) UIView *viewFromFooter;

@property (nonatomic, copy) CellClick cellClick;

- (void)returnCellClick:(CellClick)block;


@end

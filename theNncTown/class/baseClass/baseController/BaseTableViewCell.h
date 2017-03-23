// ***********************************
//
//
//           人生得意须尽欢
//
//
// ***********************************

#import <UIKit/UIKit.h>


@class BaseModel;

typedef void (^ClickCellIndex)(NSInteger index);

@interface BaseTableViewCell : UITableViewCell

///展示数据
@property (nonatomic, strong) BaseModel *baseModel;


///回传点击的单位
@property (nonatomic, copy) ClickCellIndex clickCellIndex;


///初始化cell
+ (instancetype)setCellWithTableView:(UITableView *)tableview;

- (void)retureClickCellIndex:(ClickCellIndex )block;


@end

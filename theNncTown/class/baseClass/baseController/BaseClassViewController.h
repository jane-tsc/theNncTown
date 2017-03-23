

#import <UIKit/UIKit.h>

//区分多个请求
typedef enum requestType{
    requestTypeOne = 1,
    requestTypeTwo,
    requestTypeThree,
    requestTypeFour
}requestTypeStyle;

@interface BaseClassViewController : UIViewController
/// 标题项
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, copy) NSString *backImage;
/// 设置标题
- (void)setViewControllerNavTitle:(NSString *)titleStr;
/// 返回上一级
- (void)naviPopViewControllers;

- (void)pushNextViewController:(UIViewController *)vc;

- (void)addHeaderRefresh:(UIScrollView *)scrollView andTarget:(id)target andAction:(SEL)action;
- (void)addFooterRefresh:(UIScrollView *)scrollView andTarget:(id)target andAction:(SEL)action;
- (void)clearState;
- (void)showHUD;
- (void)dismissHUD;
- (void)showNetWorkError;
- (void)showDisconnectNetWork;
- (void)showError:(NSError *)error;

@end

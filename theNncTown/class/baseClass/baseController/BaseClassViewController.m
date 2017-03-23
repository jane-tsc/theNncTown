
#import "BaseClassViewController.h"

@interface BaseClassViewController ()<UINavigationControllerDelegate,UINavigationBarDelegate,MBProgressHUDDelegate>
{
    UIImageView *navBarHairlineImageView;
    UIPercentDrivenInteractiveTransition *_interactiveTransition;
    
}
@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation BaseClassViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   // self.navigationController.navigationBar.barTintColor = PUBLICKColor;
    // [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bg"] forBarMetrics:UIBarMetricsDefault];
   // self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = COLOR(220, 220, 220, 1.0);
   // self.edgesForExtendedLayout = UIRectEdgeNone;
    [self loadCustomnavigationLeftItem:self.backImage];
    
    // 隐藏底部阴影条，传递一个空图片的UIImage对象
    //    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
   // navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    navBarHairlineImageView.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
   
    navBarHairlineImageView.hidden = NO;
    __block MBProgressHUD* progressC = self.hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        [progressC hide:YES afterDelay:0.1];
        progressC = nil;
    });
}
#pragma mark - 导航栏下的线条
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
#pragma mark - 判断是不是跳转后的页面 更改导航栏返回按钮
- (void)loadCustomnavigationLeftItem:(NSString *)backImage
{
    if (self.navigationController.viewControllers.count > 1) {
        UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        leftBtn.frame = CGRectMake(0, 0, 20, 40);
        leftBtn.backgroundColor = [UIColor clearColor];
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(11,  -7, 11, 16);
        [leftBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(naviPopViewControllers)]];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    }
}
// 设置标题
- (void)setViewControllerNavTitle:(NSString *)titleStr
{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.titleLabel.text = titleStr;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = darkText;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.navigationItem.titleView = self.titleLabel;
}
//返回上一级的操作
- (void)naviPopViewControllers{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)pushNextViewController:(UIViewController *)vc{
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)addFooterRefresh:(UIScrollView *)scrollView andTarget:(id)target andAction:(SEL)action{
    MJRefreshFooter *footer = [MJRefreshFooter footerWithRefreshingTarget:target refreshingAction:action];
    scrollView.mj_footer = footer;
}
- (void)addHeaderRefresh:(UIScrollView *)scrollView andTarget:(id)target andAction:(SEL)action{
    MJRefreshHeader *header = [MJRefreshHeader headerWithRefreshingTarget:target refreshingAction:action];
    scrollView.mj_header = header;
}
- (void)clearState{
}
- (void)showHUD{
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.delegate = self;
}
- (void)dismissHUD{
    __block MBProgressHUD* progressC = self.hud;
    dispatch_async(dispatch_get_main_queue(), ^{
        [progressC hide:YES afterDelay:0.1];
        progressC = nil;
    });
}
- (void)hudWasHidden:(MBProgressHUD *)hud{
    [self.hud removeFromSuperview];
}
- (void)showNetWorkError{
    [self.view makeToast:@"系统异常" duration:1.2 position:CSToastPositionCenter];
}
- (void)showDisconnectNetWork{
    [self.view makeToast:@"与网络断开连接" duration:1.2 position:CSToastPositionCenter];
}
- (void)showError:(NSError *)error{
    if (error.code == -1009) {
        [self showDisconnectNetWork];
    }else{
        [self showNetWorkError];
    }
}
@end

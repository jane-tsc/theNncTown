

#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0

#import "baseTabBarViewController.h"
#import "baseNavigationViewController.h"
#import "BaseClassViewController.h"
#import "AppDelegate.h"

@interface baseTabBarViewController ()<UITabBarControllerDelegate,UITabBarDelegate>

@end

static UIWindow *topWindow_;

@implementation baseTabBarViewController
/**
 * 显示顶部窗口
 */
+ (void)show
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        topWindow_ = [[UIWindow alloc] init];
        topWindow_.windowLevel = UIWindowLevelAlert;
        topWindow_.frame = [UIApplication sharedApplication].statusBarFrame;
        topWindow_.backgroundColor = [UIColor clearColor];
        topWindow_.hidden = NO;
        [topWindow_ addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topWindowClick)]];
    });
}

/**
 * 监听顶部窗口点击
 */
+ (void)topWindowClick
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [self searchAllScrollViewsInView:keyWindow];
}

/**
 * 找到参数view中所有的UIScrollView
 */
+ (void)searchAllScrollViewsInView:(UIView *)view
{
    // 递归遍历所有的子控件
    for (UIView *subview in view.subviews) {
        [self searchAllScrollViewsInView:subview];
    }
    
    
    // 判断子控件类型(如果不是UIScrollView，直接返回)
    if (![view isKindOfClass:[UIScrollView class]]) return;
    
    // 找到了UIScrollView
    UIScrollView *scrollView = (UIScrollView *)view;
    
    // 判断UIScrollView是否和window重叠（如果UIScrollView跟window没有重叠，直接返回）
//    if (![scrollView intersectsWithAnotherView:nil]) return;
    
    // 让UIScrollView滚动到最前面
    // 让CGRectMake(0, 0, 1, 1)这个矩形框完全显示在scrollView的frame框中
    [scrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}

+ (instancetype)loadTabBarController{
    
    baseTabBarViewController *yby_tabBar = [[[self class] alloc] init];
    NSArray *classArr = @[@"homeClass"
                          ,@"connectionClass"
                          ,@"shoppingCarClass"
                          ,@"myViewClass"];
    NSArray *titleArr = @[@"首页"
                          ,@"收藏"
                          ,@"购物车"
                          ,@"我的"];
    
    NSArray *imageArr = @[@"home2_ic_home_"
                          ,@"home2_ic_financial_"
                          ,@"home2_ic_community_"
                          ,@"home2_ic_profile_"
                          ,@""];
    
    NSMutableArray *yby_array = [NSMutableArray array];
    
    for (int i = 0; i < classArr.count; i ++) {
        BaseClassViewController *vc = [[NSClassFromString(classArr[i]) alloc] init];
        //设置title
        [vc setViewControllerNavTitle:titleArr[i]];
        
        // 设置tabbarItem图片
        UIImage *normalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@normal",imageArr[i]]];
        UIImage *selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@selected",imageArr[i]]];
        if (IOS7) {
            vc.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            vc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }else {
            vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:normalImage selectedImage:selectedImage];
//            [vc.tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:normalImage];
        }
        
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(-2.0, 0, 2.0, 0);

        baseNavigationViewController *navigationController = [[baseNavigationViewController alloc] initWithRootViewController:vc];
        navigationController.tabBarItem.title = titleArr[i];
        navigationController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5);
        [yby_array addObject:navigationController];
    }
    
    yby_tabBar.viewControllers = yby_array;
    yby_tabBar.tabBar.barTintColor = WHITECOLOR;
    //设置UITabBarItem属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:darkText, NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:10.0f]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:PUBLICKColor, NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:10.0f]} forState:UIControlStateSelected];
    yby_tabBar.tabBarItem = item;
    
    return yby_tabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end


#import "UITabBar+badge.h"
#define TabbarItems 4.0
@implementation UITabBar (badge)
- (void)showBadgeOnItemIndex:(NSInteger)index{
    [self removeBadgeOnItemIndex:index];
    //新建badge
    UIView *badgeView = [[UIView alloc] init];
    badgeView.tag = 999 + index;
    badgeView.layer.cornerRadius = 4;
    badgeView.backgroundColor = PUBLICKColor;
    CGRect tabFrame = self.frame;
    //定位置
    float percentX = (index + 0.6)/TabbarItems;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 8, 8);
    [self addSubview:badgeView];
}
- (void)removeBadgeOnItemIndex:(NSInteger)index{
    for (UIView *view in self.subviews) {
        if (view.tag == 999 + index) {
            [view removeFromSuperview];
        }
    }
}
- (void)hideBadgeOnItemIndex:(NSInteger)index{
    [self removeBadgeOnItemIndex:index];
}

@end

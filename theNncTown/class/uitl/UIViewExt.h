


#import <UIKit/UIKit.h>
CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;
@property (readonly) CGPoint topLeft;

@property CGFloat height1;
@property CGFloat width1;

@property CGFloat top1;
@property CGFloat left1;

@property CGFloat bottom1;
@property CGFloat right1;

@property (nonatomic, assign) CGPoint centerX;
@property (nonatomic, assign) CGPoint centerY;
- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
@end
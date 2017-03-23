
#import "YBYLabel.h"

@implementation YBYLabel

+ (instancetype)initWithFrame:(CGRect)frame andFont:(UIFont *)font andAlignment:(NSTextAlignment )alignment andTextColor:(UIColor *)color andText:(NSString *)text{
    YBYLabel *lab = [[[self class] alloc] initWithFrame:frame];
    lab.text = text;
    lab.textColor = color;
    lab.textAlignment = alignment;
    lab.font = font;
    lab.numberOfLines = 0;
    lab.userInteractionEnabled = YES;
    return lab;
}

@end

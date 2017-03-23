



#import "UILabel+ContentSize.h"

@implementation UILabel (ContentSize)

- (CGSize)contentSize
{
    
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode             = NSLineBreakByCharWrapping;
    paragraphStyle.alignment                 = self.textAlignment;
    
    NSDictionary * attributes                = @{NSFontAttributeName : self.font,
                                                 NSParagraphStyleAttributeName : paragraphStyle};
    
    return [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 50, 1000)
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:attributes
                                   context:nil].size;
}

@end

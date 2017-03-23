//
//  leftCell.m
//  theNncTown
//
//  Created by lanren on 16/12/1.
//  Copyright © 2016年 com.nnctown. All rights reserved.
//

#import "leftCell.h"

@implementation leftCell

- (UIImageView *)leftImage{
    if (_leftImage == nil) {
        _leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(GetWidth(30), GetWidth(80) / 2.0 - GetWidth(35) / 2.0, GetWidth(35), GetWidth(35))];
        [self.contentView addSubview:_leftImage];
    }
    return _leftImage;
}
- (YBYLabel *)leftContents{
    if (_leftContents == nil) {
        _leftContents = [YBYLabel initWithFrame:CGRectMake(self.leftImage.right1 + GetWidth(20), 0, GetWidth(200), GetWidth(80)) andFont:FONTSIZE(14) andAlignment:NSTextAlignmentLeft andTextColor:WHITECOLOR andText:@""];
        _leftContents.userInteractionEnabled = NO;
        [self.contentView addSubview:_leftContents];
    }
    return _leftContents;
}
- (UIImageView *)rightImage{
    if (_rightImage == nil) {
        _rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(GetWidth(380), GetWidth(80) / 2.0 - GetWidth(35) / 2.0, GetWidth(35), GetWidth(35))];
        [self.contentView addSubview:_rightImage];
    }
    return _rightImage;
}
- (UIView *)leftLine{
    if (_leftLine == nil) {
        _leftLine = [[UIView alloc] initWithFrame:CGRectMake(GetWidth(30), GetWidth(80) - 1, GetWidth(400), 0.7)];
        [self.contentView addSubview:_leftLine];
    }
    return _leftLine;
}
- (void)layoutSubviews{
    self.leftContents.width1 = [self.leftContents contentSize].width;
    self.leftImage.backgroundColor = ORANGECOLOR;
    self.rightImage.backgroundColor = ORANGECOLOR;
    self.leftLine.backgroundColor = WHITECOLOR;
}
@end

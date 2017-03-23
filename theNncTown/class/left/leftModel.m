//
//  leftModel.m
//  theNncTown
//
//  Created by lanren on 16/12/1.
//  Copyright © 2016年 com.nnctown. All rights reserved.
//

#import "leftModel.h"

@implementation leftModel

+ (NSArray *)shareModel{
    leftModel *model1 = [[[self class] alloc] init];
    model1.leftImage = @"";
    model1.leftClass = @"";
    model1.leftContent = @"女装";
    
    leftModel *model2 = [[[self class] alloc] init];
    model2.leftImage = @"";
    model2.leftClass = @"";
    model2.leftContent = @"男装";
    
    leftModel *model3 = [[[self class] alloc] init];
    model3.leftImage = @"";
    model3.leftClass = @"";
    model3.leftContent = @"美妆";
    
    leftModel *model4 = [[[self class] alloc] init];
    model4.leftImage = @"";
    model4.leftClass = @"";
    model4.leftContent = @"鞋包";
    
    leftModel *model5 = [[[self class] alloc] init];
    model5.leftImage = @"";
    model5.leftClass = @"";
    model5.leftContent = @"母婴";
    
    leftModel *model6 = [[[self class] alloc] init];
    model6.leftImage = @"";
    model6.leftClass = @"";
    model6.leftContent = @"数码";
    
    leftModel *model7 = [[[self class] alloc] init];
    model7.leftImage = @"";
    model7.leftClass = @"";
    model7.leftContent = @"品牌生活";
    
    return @[model1,model2,model3,model4,model5,model6,model7];
}
@end

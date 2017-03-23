//
//  leftModel.h
//  theNncTown
//
//  Created by lanren on 16/12/1.
//  Copyright © 2016年 com.nnctown. All rights reserved.
//

#import "BaseModel.h"

@interface leftModel : BaseModel
@property (nonatomic, copy) NSString *leftImage;
@property (nonatomic, copy) NSString *leftContent;
@property (nonatomic, copy) NSString *leftClass;
+ (NSArray *)shareModel;
@end

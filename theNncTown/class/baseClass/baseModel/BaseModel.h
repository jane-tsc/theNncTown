// ***********************************
//
//
//            今朝有酒今朝醉
//
//
// ***********************************

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject


///将对应的数据装在model里
+ (instancetype)modelFromDict:(NSDictionary *)dic;

///将字典里的数据装在model里
+ (NSArray *)arrayFromDict:(NSDictionary *)dict;

///将数组里的数据装在model里
+ (NSArray *)arrayFromArray:(NSArray *)array;



@end



#import "BaseModel.h"

@implementation BaseModel

+ (instancetype)modelFromDict:(NSDictionary *)dict
{
    BaseModel *model = [[BaseModel alloc]init];
   
    return model;
}
+ (NSArray *)arrayFromDict:(NSDictionary *)dict
{
    NSArray *array = [dict objectForKey:@"json"];
    return [[self class] arrayFromArray:array];
}

+ (NSArray *)arrayFromArray:(NSArray *)array
{
    NSMutableArray *models = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in array) {
        [models addObject:[[self class] modelFromDict:dict]];
    }
    if (models.count <= 0) {
        models = nil;
    }
    return models;
}

@end

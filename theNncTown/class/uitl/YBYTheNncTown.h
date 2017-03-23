

#import <Foundation/Foundation.h>

typedef enum {
    queryGet = 1,
    queryPost
}queryStyle;

typedef void (^RequestSuccess)(id responseObject);
typedef void (^Failed)(NSError *error);

@interface YBYTheNncTown : NSObject

+ (instancetype)sharedFinancial;
- (void)queryWithPoint:(queryStyle) qStyle andParamsDictionary:(NSString *)params
                andURL:(NSString *)url
andSuccessCompletioned:(RequestSuccess)success
             andFailed:(Failed)fail;

+ (void)saveUserName:(NSString *)userName;
+ (void)saveUserId:(NSString *)userId;
+ (void)saveUserPhone:(NSString *)phone;
+ (void)saveUserRealName:(NSString *)realName;
+ (void)saveUserHeaderImage:(NSString *)image;

+ (NSString *)getUserName;
+ (NSString *)getUserId;
+ (NSString *)getUserPhone;
+ (NSString *)getRealName;
+ (NSString *)getuserHeaderImage;

+ (NSDictionary*) getRequestResultWith:(id)responseObj;
+ (BOOL) checkTelNumber:(NSString *) telNumber;
+ (BOOL) isValidateEmail:(NSString *)email;
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
+ (BOOL) validateNickname:(NSString *)nickname;
+ (NSMutableAttributedString *)attributString:(NSString *)str andRange:(NSRange)range;
+ (BOOL)isAllNum:(NSString *)string;
+ (UIImage *)imageWithColor:(UIColor *)color ;
@end

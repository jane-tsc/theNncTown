

#import "YBYTheNncTown.h"

@implementation YBYTheNncTown 

+(BOOL)isValidateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:email];
}
+(NSDictionary*)getRequestResultWith:(id)responseObj{
    if (responseObj) {
        if ([responseObj isKindOfClass:[NSData class]]) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableContainers error:nil];
            return dict;
        }else{
            NSData * data = [NSJSONSerialization dataWithJSONObject:responseObj options:NSJSONWritingPrettyPrinted error:nil];
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            return dict;
        }
    }else{
        return nil;
    }
}
+ (BOOL)checkTelNumber:(NSString *) telNumber
{
    NSString *pattern = @"^1+[34578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}
+ (void)saveUserName:(NSString *)userName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userName forKey:@"user_Name"];
    [defaults synchronize];
}
+ (NSString *)getUserName{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"user_Name"] == nil) {
        return @"";
    }else{
        
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_Name"];
        return string;
    }
    
}
+ (void)saveUserId:(NSString *)userid{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userid forKey:@"user_id"];
    [defaults synchronize];
}
+ (NSString *)getUserId{

    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"] == nil) {
        return @"-1";
    }else{
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
        return string;
    }
}

+ (void)saveUserPhone:(NSString *)phone{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:phone forKey:@"phone"];
    [defaults synchronize];
}
+ (NSString *)getUserPhone{
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"phone"] == nil) {
        return @"";
    }else{
        
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"phone"];
        return string;
    }
    
}
+ (void)saveUserRealName:(NSString *)realName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:realName forKey:@"realName"];
    [defaults synchronize];
}
+ (NSString *)getRealName{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"realName"] == nil) {
        return @"";
    }else{
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"realName"];
        return string;
    }
}
+ (void)saveUserHeaderImage:(NSString *)image{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:image forKey:@"image"];
    [defaults synchronize];
}
+ (NSString *)getuserHeaderImage{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"image"] == nil) {
        return @"";
    }else{
        
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"image"];
        return string;
    }
}
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//昵称
+ (BOOL) validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

+ (NSMutableAttributedString *)attributString:(NSString *)str andRange:(NSRange)range{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:str];
    [string addAttribute:NSForegroundColorAttributeName value:COLOR(228, 57, 60, 1.0) range:range];
    return string;
    
}
+ (BOOL)isAllNum:(NSString *)string{
    
    unichar c;
    for (int i = 0; i < string.length; i ++) {
        c = [string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
    
}
+ (NSString *)stringFroDete:(NSDate *)date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:date];
    
}
+ (instancetype)sharedFinancial{
    //实例化对象
    static dispatch_once_t token;
    static YBYTheNncTown *_request;
    dispatch_once(&token, ^{
        _request = [[YBYTheNncTown alloc] init];
    });
    return _request;
}
- (void)queryWithPoint:(queryStyle) qStyle andParamsDictionary:(NSDictionary *)params
                andURL:(NSString *)url
andSuccessCompletioned:(RequestSuccess)success
             andFailed:(Failed)fail{
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", nil];
    //[sessionManager.requestSerializer setValue:@"" forHTTPHeaderField:@"Referer"];
    
    if (qStyle == queryGet) {
        
        [sessionManager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            fail(error);
        }];
    }else{
        [sessionManager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dic = [YBYTheNncTown getRequestResultWith:responseObject];
            success(dic);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            fail(error);
        }];
    }
}
//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end

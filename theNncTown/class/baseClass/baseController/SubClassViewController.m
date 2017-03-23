

#import "SubClassViewController.h"

@interface SubClassViewController ()

@end

@implementation SubClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//- (NSMutableDictionary *)parameter{
//    if (!_parameter) {
//        //公共参数
//        _parameter = [[NSMutableDictionary alloc] initWithDictionary:@{@"accessToken":[LRTheFinancial getAccessToken],@"OS":@"iOS",@"version":@"1.0.0",@"apiUid":[LRTheFinancial getUserId],@"pageSize":@""}];
//    }
//    return _parameter;
//}
- (NSString *)requestUrl:(NSString *)url{
   
    return URL(url);
}
- (void)postData{
    
    [[YBYTheNncTown sharedFinancial] queryWithPoint:queryPost andParamsDictionary:self.parameter andURL:[self requestUrl:self.interface] andSuccessCompletioned:^(id responseObject) {
        [self requsetResult:responseObject];
        [self dismissHUD];
    } andFailed:^(NSError *error) {
        [self dismissHUD];
        [self requestError:error];
    }];
}
- (void)getData{
    if (self.isShow == YES) {
    }else{
         [self showHUD];
    }
   
    //AFNetworking get
    [[YBYTheNncTown sharedFinancial] queryWithPoint:queryGet andParamsDictionary:self.parameter andURL:[self requestUrl:self.interface] andSuccessCompletioned:^(id responseObject) {
        [self requsetResult:responseObject];
        [self dismissHUD];
    } andFailed:^(NSError *error) {
        [self requestError:error];
        [self dismissHUD];
    }];
    
}
- (void)requestError:(id)error {}
- (void)requsetResult:(id)resObject {}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

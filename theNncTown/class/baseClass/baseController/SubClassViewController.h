

/*!
 *
 *
 *
 *   t-t  始于2016.8.13 21:02 若使用中遇到问题请联系（QQ：1205686823）
 *
 *
 */

#import "BaseClassViewController.h"
/*!
 *  @abstract  区分多次请求
 *
 */
typedef enum typeRequest{
    requestOne = 1,
    requestTwo,
    requestTheree,
    requestFour,
    requestFive,
    requestOhter
}requestType;

@interface SubClassViewController : BaseClassViewController

/*!
 *  @abstract  接口名称
 *
 *
 */
@property (nonatomic, copy) NSString *interface;
/*!
 *  @abstract  参数集合
 *
 *  
 */
@property (nonatomic, assign) NSInteger isNewVersion;
@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, copy) NSString *parameter;
/*!
 *  @abstract  post请求
 *
 */
- (void)postData;
/*!
 *  －
 *
 */
- (void)getData;
/*!
 *  @abstract  返回数据和类型
 *
 */
- (void)requsetResult:(id)resObject;
/*!
 *  @abstract  返回错误和类型
 *
 */
- (void)requestError:(id)error;
@end

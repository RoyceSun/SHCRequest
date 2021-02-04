//
//  SHCRequestFunction.h
//  SHZP
//
//  Created by 孙海琛 on 2021/2/4.
//

#import <Foundation/Foundation.h>

//请求进度回调block
typedef void (^requestProgressBlock)(NSProgress *progressObj);
//请求完成回调block
typedef void (^requestCompleteBlock)(NSURLSessionDataTask * task, id responseObject, NSError *error);

@class NetModel;

typedef enum : NSUInteger {
    request_POST,
    request_GET,
    request_PUT,
    request_DELETE,
} RequestType;

@interface SHCRequestFunction : NSObject
+ (void)networkManager:(void(^)(SHCRequestFunction *manager))block;
//请求url
- (SHCRequestFunction * (^)(NSString *url))url;
- (SHCRequestFunction *)url:(NSString *)url;
//请求参数
- (SHCRequestFunction * (^)(id parameters))parameters;
- (SHCRequestFunction *)parameters:(id)parameters;
//请求头字典（外部定义）
- (SHCRequestFunction * (^)(NSMutableDictionary *headerDic))headerDic;
- (SHCRequestFunction *)headerDic:(NSMutableDictionary *)headerDic;
//请求方式
- (SHCRequestFunction * (^)(RequestType type))type;
- (SHCRequestFunction *)type:(RequestType)type;
//当前请求进度
- (SHCRequestFunction * (^)(requestProgressBlock progress))progress;
- (SHCRequestFunction *)progress:(requestProgressBlock)progress;
//请求完成
- (SHCRequestFunction * (^)(requestCompleteBlock complete))complete;
- (SHCRequestFunction *)complete:(requestCompleteBlock)complete;


- (void)postRequest;
- (void)getRequest;
- (void)putRequest;
- (void)deleteRequest;

@end

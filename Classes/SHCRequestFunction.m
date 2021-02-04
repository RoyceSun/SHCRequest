//
//  SHCRequestFunction.m
//  SHZP
//
//  Created by 孙海琛 on 2021/2/4.
//

#import "SHCRequestFunction.h"
#import "SHCHTTPSessionManager.h"
@interface SHCRequestFunction ()

@property NSString *requestUrl;
@property id requestParameters;
@property NSMutableDictionary * requestHeader;
@property RequestType requestType;
@property requestProgressBlock requestProgress;
@property requestCompleteBlock requestComplete;
@end

@implementation SHCRequestFunction
+ (void)networkManager:(void(^)(SHCRequestFunction *manager))block
{
    SHCRequestFunction *networkManager = [[SHCRequestFunction alloc] init];
    block(networkManager);
}
- (SHCRequestFunction *)url:(NSString *)url
{
    self.requestUrl = url;
    return self;
}
- (SHCRequestFunction * (^)(NSString *))url {
    return ^id(NSString * url) {
        self.requestUrl = url;
        return self;
    };
}
- (SHCRequestFunction *)parameters:(id)parameters
{
    self.requestParameters = parameters;
    return self;
}
- (SHCRequestFunction * (^)(id parameters))parameters {
    return ^id(id parameters){
        self.requestParameters = parameters;
        return self;
    };
}
-(SHCRequestFunction *)headerDic:(NSMutableDictionary *)headerDic
{
    self.requestHeader = headerDic;
    return self;
}
- (SHCRequestFunction * (^)(NSMutableDictionary *headerDic))headerDic
{
    return ^id(NSMutableDictionary *headerDic){
        self.requestHeader = headerDic;
        return self;
    };
}
- (SHCRequestFunction *)type:(RequestType)type
{
    self.requestType = type;
    return self;
}
- (SHCRequestFunction * (^)(RequestType type))type;
{
    return ^id(RequestType type){
        self.requestType = type;
        return self;
    };
}
- (SHCRequestFunction *)progress:(requestProgressBlock)progress {
    self.requestProgress = progress;
    return self;
}
- (SHCRequestFunction *(^)(requestProgressBlock progress))progress {
    return ^id(requestProgressBlock progress) {
        self.requestProgress = progress;
        return self;
    };
}
- (SHCRequestFunction *)complete:(requestCompleteBlock)complete {
    self.requestComplete = complete;
    return self;
}

- (SHCRequestFunction *(^)(requestCompleteBlock complete))complete {
    return ^id(requestCompleteBlock complete) {
        self.requestComplete = complete;
        return self;
    };
}


- (void)postRequest
{
    SHCHTTPSessionManager *manager = [SHCHTTPSessionManager sharedClient];
    //遍历请求头字典
    if (!self.requestHeader) {
        NSArray *arrH = [self.requestHeader allKeys];
        for (NSInteger i = 0; i < arrH.count; i++) {
            [manager.requestSerializer setValue:self.requestHeader[[self.requestHeader objectForKey:arrH[i]]]
            forHTTPHeaderField:[self.requestHeader objectForKey:arrH[i]]];
        }
    }
//    NSURLSessionDataTask *newTask =
    [manager POST:self.requestUrl parameters:self.requestParameters headers:@{} progress:^(NSProgress * _Nonnull uploadProgress)
    {
        if (self.requestProgress) {
            self.requestProgress(uploadProgress);
        }
    }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSLog(@"请求URL:%@\n请求参数:%@\n请求返回值:%@",task.currentRequest.URL.absoluteString,self.parameters,responseObject);
        if (self.requestComplete) {
            self.requestComplete(task, responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"POST Request Error:%@",error);
        if (self.requestComplete) {
            self.requestComplete(task, nil, error);
        }
    }];
}
- (void)getRequest
{
    SHCHTTPSessionManager *manager = [SHCHTTPSessionManager sharedClient];
    //遍历请求头字典
    if (!self.requestHeader) {
        NSArray *arrH = [self.requestHeader allKeys];
        for (NSInteger i = 0; i < arrH.count; i++) {
            [manager.requestSerializer setValue:self.requestHeader[[self.requestHeader objectForKey:arrH[i]]]
            forHTTPHeaderField:[self.requestHeader objectForKey:arrH[i]]];
        }
    }
    NSString *url = self.requestUrl;
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //NSURLSessionDataTask *newTask =
    [manager GET:url parameters:self.requestParameters headers:@{} progress:^(NSProgress * _Nonnull downloadProgress)
    {
        if (self.requestProgress) {
            self.requestProgress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSLog(@"请求URL:%@\n请求参数:%@\n请求返回值:%@",task.currentRequest.URL.absoluteString,self.parameters,responseObject);
        if (self.requestComplete) {
            self.requestComplete(task, responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"GET Request Error:%@",error);
        if (self.requestComplete) {
            self.requestComplete(task, nil, error);
        }
    }];
}
- (void)putRequest
{
    SHCHTTPSessionManager *manager = [SHCHTTPSessionManager sharedClient];
    //遍历请求头字典
    if (!self.requestHeader) {
        NSArray *arrH = [self.requestHeader allKeys];
        for (NSInteger i = 0; i < arrH.count; i++) {
            [manager.requestSerializer setValue:self.requestHeader[[self.requestHeader objectForKey:arrH[i]]]
            forHTTPHeaderField:[self.requestHeader objectForKey:arrH[i]]];
        }
    }
    //NSURLSessionDataTask *newTask =
    [manager PUT:self.requestUrl parameters:self.requestParameters headers:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSLog(@"请求URL:%@\n请求参数:%@\n请求返回值:%@",task.currentRequest.URL.absoluteString,self.parameters,responseObject);
        if (self.requestComplete) {
            self.requestComplete(task, responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"PUT Request Error:%@",error);
        if (self.requestComplete) {
            self.requestComplete(task, nil, error);
        }
    }];
}
- (void)deleteRequest
{
    SHCHTTPSessionManager *manager = [SHCHTTPSessionManager sharedClient];
    //遍历请求头字典
    if (!self.requestHeader) {
        NSArray *arrH = [self.requestHeader allKeys];
        for (NSInteger i = 0; i < arrH.count; i++) {
            [manager.requestSerializer setValue:self.requestHeader[[self.requestHeader objectForKey:arrH[i]]]
            forHTTPHeaderField:[self.requestHeader objectForKey:arrH[i]]];
        }
    }
    //NSURLSessionDataTask *newTask = 
    [manager DELETE:self.requestUrl parameters:self.requestParameters headers:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求URL:%@\n请求参数:%@\n请求返回值:%@",task.currentRequest.URL.absoluteString,self.parameters,responseObject);
        if (self.requestComplete) {
            self.requestComplete(task, responseObject, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"DELETE Request Error:%@",error);
        if (self.requestComplete) {
            self.requestComplete(task, nil, error);
        }
    }];
}
@end


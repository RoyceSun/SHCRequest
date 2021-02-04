//
//  SHCHTTPSessionManager.m
//  LCFN-Buyers
//
//  Created by 孙海琛 on 2019/6/3.
//  Copyright © 2019 royce. All rights reserved.
//

//设置接口版本号
#define APP_BuildVesion @"20"


#import "SHCHTTPSessionManager.h"

static SHCHTTPSessionManager*_shcSeccionM = nil;

@implementation SHCHTTPSessionManager
+ (instancetype)sharedClient
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shcSeccionM = [SHCHTTPSessionManager manager];
        _shcSeccionM.requestSerializer = [AFJSONRequestSerializer serializer];
        // 设置超时时间
        [_shcSeccionM.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _shcSeccionM.requestSerializer.timeoutInterval = 15.f;
        [_shcSeccionM.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        // 编码
        _shcSeccionM.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        //接收参数类型
        _shcSeccionM.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
    });
    return _shcSeccionM;
}
@end

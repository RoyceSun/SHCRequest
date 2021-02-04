//
//  SHCHTTPSessionManager.h
//  LCFN-Buyers
//
//  Created by 孙海琛 on 2019/6/3.
//  Copyright © 2019 royce. All rights reserved.
//

#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHCHTTPSessionManager : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end

NS_ASSUME_NONNULL_END

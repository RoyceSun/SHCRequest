//
//  SHCRequestTool.h
//  SHZP
//
//  Created by 孙海琛 on 2021/2/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHCRequestTool : NSObject
/*
 *判断是否连网
 *返回值:yes 以连网
 *      no  未连网
 */
+(BOOL)shcConnectedToNetwork;
@end

NS_ASSUME_NONNULL_END

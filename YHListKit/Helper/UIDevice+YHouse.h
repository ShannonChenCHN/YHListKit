//
//  UIDevice+YHouse.h
//  YHLibrary
//
//  Created by ShannonChen on 2017/10/26.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import <UIKit/UIKit.h>

// 系统版本号判断
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version) [UIDevice yh_systemVersionGreaterThanOrEqualTo:version]
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO_iOS_11_0  SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0")



@interface UIDevice (YHouse)

/// 当前系统版本号是否大于或等于 required version
+ (BOOL)yh_systemVersionGreaterThanOrEqualTo:(NSString *)requiredVersion;

@end

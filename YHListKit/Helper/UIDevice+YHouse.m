//
//  UIDevice+YHouse.m
//  YHLibrary
//
//  Created by ShannonChen on 2017/10/26.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import "UIDevice+YHouse.h"

@implementation UIDevice (YHouse)

// https://stackoverflow.com/a/3339787
// https://pspdfkit.com/blog/2016/efficient-iOS-version-checking/
+ (BOOL)yh_systemVersionGreaterThanOrEqualTo:(NSString *)requiredVersion {
    
    NSString *currentVersion = [[UIDevice currentDevice] systemVersion];
    if ([currentVersion compare:requiredVersion options:NSNumericSearch] != NSOrderedAscending) {
        return YES;
    }
    
    return NO;
}

@end

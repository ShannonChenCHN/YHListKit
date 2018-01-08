//
//  YHCollectionViewSectionModel.m
//  YHOUSE
//
//  Created by ShannonChen on 2017/11/28.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import "YHCollectionViewSectionModel.h"

@implementation YHCollectionViewSectionModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _headerHeight = CGFLOAT_MAX;
        _footerHeight = CGFLOAT_MAX;
    }
    return self;
}


@end

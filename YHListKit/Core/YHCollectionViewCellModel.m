//
//  YHCollectionViewCellModel.m
//  YHOUSE
//
//  Created by ShannonChen on 2017/11/28.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import "YHCollectionViewCellModel.h"

@implementation YHCollectionViewCellModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellHeight = CGFLOAT_MAX;
        _cellWidth = CGFLOAT_MAX;
    }
    return self;
}

- (void)collectionViewDidSelectItem:(UICollectionView *)collectionView {
    // 子类重写
}

@end

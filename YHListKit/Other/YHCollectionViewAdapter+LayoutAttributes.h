//
//  YHCollectionViewAdapter+LayoutAttributes.h
//  YHOUSE
//
//  Created by ShannonChen on 2017/11/29.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import "YHCollectionViewAdapter.h"

@interface YHCollectionViewAdapter (LayoutAttributes)

- (CGFloat)sectionTopForSectionModel:(YHCollectionViewSectionModel *)sectionModel;
- (CGFloat)sectionBottomForSectionModel:(YHCollectionViewSectionModel *)sectionModel;

@end

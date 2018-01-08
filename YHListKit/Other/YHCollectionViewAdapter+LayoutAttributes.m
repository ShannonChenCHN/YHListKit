//
//  YHCollectionViewAdapter+LayoutAttributes.m
//  YHOUSE
//
//  Created by ShannonChen on 2017/11/29.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import "YHCollectionViewAdapter+LayoutAttributes.h"

@implementation YHCollectionViewAdapter (LayoutAttributes)

- (CGFloat)sectionTopForSectionModel:(YHCollectionViewSectionModel *)sectionModel {
    if (sectionModel == nil) {
        return CGFLOAT_MAX;
    }
    
    NSIndexPath *firstIndexPath = [NSIndexPath indexPathForItem:0 inSection:sectionModel.section];
    
    UICollectionViewLayoutAttributes *headerAttr = nil;
    if (sectionModel.headerClass) {
        headerAttr = [self.collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:firstIndexPath];
    }
    
    UICollectionViewLayoutAttributes *firstCellAttr = nil;
    if (sectionModel.cellModels.count) {
        firstCellAttr = [self.collectionView.collectionViewLayout layoutAttributesForItemAtIndexPath:firstIndexPath];
    }
    
    CGFloat sectionTop = headerAttr ? headerAttr.frame.origin.y : firstCellAttr.frame.origin.y;
    
    return sectionTop;
}

- (CGFloat)sectionBottomForSectionModel:(YHCollectionViewSectionModel *)sectionModel {
    if (sectionModel == nil) {
        return CGFLOAT_MAX;
    }
    
    
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForItem:sectionModel.cellModels.count - 1 inSection:sectionModel.section];
    
    UICollectionViewLayoutAttributes *footerAttr = nil;
    if (sectionModel.footerClass) {
        // workaround: 使用 self.collectionView 的 layoutAttributesForSupplementaryElementOfKind: 时，导致 footer 显示出现问题（城市指南切换城市后“城中热门”板块出现了多余的分割线）
        footerAttr = [self.collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:lastIndexPath];
    }
    
    UICollectionViewLayoutAttributes *lastCellAttr = nil;
    if (sectionModel.cellModels.count) {
        lastCellAttr = [self.collectionView.collectionViewLayout layoutAttributesForItemAtIndexPath:lastIndexPath];
    }
    
    
    CGFloat sectionBottom = footerAttr ? footerAttr.frame.origin.y + footerAttr.frame.size.height : lastCellAttr.frame.origin.y + lastCellAttr.frame.size.height;
    
    return sectionBottom;
}

@end

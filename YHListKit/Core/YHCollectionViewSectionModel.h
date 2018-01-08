//
//  YHCollectionViewSectionModel.h
//  YHOUSE
//
//  Created by ShannonChen on 2017/11/28.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHCollectionViewCellModel.h"

/**
 通用 section model
 */
@interface YHCollectionViewSectionModel : NSObject

@property (strong, nonatomic) Class headerClass;
@property (copy, nonatomic) NSString *headerTitle;
@property (assign, nonatomic) CGFloat headerTitleOriginY; // 标题原点 Y
@property (copy, nonatomic) NSString *headerSubtitle;
@property (assign, nonatomic) CGFloat headerHeight;
@property (assign, nonatomic) CGFloat headerWidth;
@property (strong, nonatomic) id headerModel;  // 可选字段

@property (assign, nonatomic) NSInteger section;
@property (assign, nonatomic) NSInteger numberOfSectionsInCollectionView;

@property (strong, nonatomic) NSArray <YHCollectionViewCellModel *> *cellModels;

@property (copy, nonatomic) NSString *footerTitle;
@property (assign, nonatomic) CGFloat footerWidth;
@property (assign, nonatomic) CGFloat footerHeight;
@property (strong, nonatomic) Class footerClass;


@end

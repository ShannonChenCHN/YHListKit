//
//  YHCollectionViewAdapter.h
//  YHOUSE
//
//  Created by ShannonChen on 2017/11/28.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHCollectionViewSectionModel.h"
#import "YHCollectionViewCellModel.h"

@class YHCollectionViewAdapter;

@protocol YHCollectionViewAdapterDelegate <NSObject>

@optional

/// 复用 cell
- (void)collectionViewAdapter:(YHCollectionViewAdapter *)adapter didDequeueCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

/// 复用 Supplementary View
- (void)collectionViewAdapter:(YHCollectionViewAdapter *)adapter didDequeueSupplementaryView:(UICollectionReusableView *)view ofKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

@end



/**
 包装 UICollectionView 代理方法的适配器
 */
@interface YHCollectionViewAdapter : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) id <YHCollectionViewAdapterDelegate> delegate;
@property (weak, nonatomic) id <UICollectionViewDelegate> collectionViewDelegate;
@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) NSArray <YHCollectionViewSectionModel *> *sectionModels;


/// 便捷读取 view model 的方法
- (YHCollectionViewSectionModel *)collectionView:(UICollectionView *)collectionView viewModelForSection:(NSInteger)section;
- (YHCollectionViewCellModel *)collectionView:(UICollectionView *)collectionView cellModelForItemAtIndexPath:(NSIndexPath *)indexPath;

/// 获取 section header 的方法，针对 iOS 9 以下的适配
/// https://stackoverflow.com/a/13410537
- (UICollectionReusableView *)sectionHeaderForSection:(NSInteger)section;

@end

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


/**
 提供给业务方使用的配置接口，在复用 Cell 和 Supplementary View 之后可以根据自己的需要进行配置，比如设置 cell 的 delegate
 */
@protocol YHCollectionViewAdapterDelegate <NSObject>

@optional


/**
 复用 cell 之后会调用该方法

 @param adapter YHCollectionViewAdapter 对象
 @param cell 被复用的 cell
 @param indexPath 被复用 cell 的 indexPath
 */
- (void)collectionViewAdapter:(YHCollectionViewAdapter *)adapter didDequeueCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

/**
 复用 Supplementary View 之后会调用该方法

 @param adapter YHCollectionViewAdapter 对象
 @param view 被复用的 Supplementary View
 @param kind Supplementary View 的类型
 @param indexPath 被复用的 Supplementary View 的 indexPath
 */
- (void)collectionViewAdapter:(YHCollectionViewAdapter *)adapter didDequeueSupplementaryView:(UICollectionReusableView *)view ofKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

@end



/**
 包装 UICollectionView 代理方法的适配器
 */
@interface YHCollectionViewAdapter : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) id <YHCollectionViewAdapterDelegate> delegate;              ///< YHCollectionViewAdapter 的 delegate
@property (weak, nonatomic) id <UICollectionViewDelegate> collectionViewDelegate;       ///< UICollectionViewDelegate 方法回调时，会传递给该代理
@property (strong, nonatomic) UICollectionView *collectionView;                         ///< 绑定的 collection view

@property (strong, nonatomic) NSArray <YHCollectionViewSectionModel *> *sectionModels;  ///< 数据源


/* 便捷读取 view model 的方法 */

/// 获取某个 section 对应的 view model
- (YHCollectionViewSectionModel *)collectionView:(UICollectionView *)collectionView viewModelForSection:(NSInteger)section;
    
/// 获取某个 indexPath 对应的 cell model
- (YHCollectionViewCellModel *)collectionView:(UICollectionView *)collectionView cellModelForItemAtIndexPath:(NSIndexPath *)indexPath;

/// 获取 section header 的方法，针对 iOS 9 以下的适配
/// https://stackoverflow.com/a/13410537
- (UICollectionReusableView *)sectionHeaderForSection:(NSInteger)section;

@end

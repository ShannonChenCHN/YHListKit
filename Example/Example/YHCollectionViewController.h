//
//  YHCollectionViewController.h
//  YHOUSE
//
//  Created by ShannonChen on 2017/10/30.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 列表 controller 的基类
 */
@interface YHCollectionViewController : UIViewController 

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *collectionViewLayout;


/************************************** 下拉刷新和上拉加载更多 *************************************/

// 是否展示下拉刷新
- (BOOL)pullToRefreshEnabled;

// 是否展示上拉加载更多
- (BOOL)pullToLoadMoreEnabled;

// 下拉刷新被触发
- (void)viewDidTriggerRefresh;

// 上拉加载更多被触发
- (void)viewDidTriggerLoadMore;

// 结束下拉刷新
- (void)endHeaderRefreshing;

// 结束上拉加载更多
- (void)endFooterRefreshing:(BOOL)isLastPage;


@end

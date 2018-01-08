//
//  YHCollectionViewController.m
//  YHOUSE
//
//  Created by ShannonChen on 2017/10/30.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import "YHCollectionViewController.h"
#import "MJRefresh.h"

@interface YHCollectionViewController ()


@end

@implementation YHCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];


    [self.view addSubview:self.collectionView];

    // 设置下拉刷新和上拉加载更多
    if ([self pullToRefreshEnabled]) {
        self.collectionView.mj_header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(viewDidTriggerRefresh)];
    }
    
    if ([self pullToLoadMoreEnabled]) {
        self.collectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(viewDidTriggerLoadMore)];
    }
    
}


#pragma mark - 下拉刷新和上拉加载更多
- (BOOL)pullToRefreshEnabled {
    return NO;
}

- (BOOL)pullToLoadMoreEnabled {
    return NO;
}

- (void)viewDidTriggerRefresh {
    
}

- (void)viewDidTriggerLoadMore {
    
}

- (void)endHeaderRefreshing {
    // https://github.com/CoderMJLee/MJRefresh/issues/225#issuecomment-325103061
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView.mj_header endRefreshing];
    });
}

- (void)endFooterRefreshing:(BOOL)isLastPage {
    
    if (isLastPage) {
        
        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        
    } else {
        
        [self.collectionView.mj_footer endRefreshing];
    }
}


#pragma mark - Getter

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                 collectionViewLayout:self.collectionViewLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.backgroundColor = [UIColor colorWithRed:244 green:244 blue:244 alpha:1.0];
        _collectionView.alwaysBounceVertical = YES;
    }
    
    return _collectionView;
}

- (UICollectionViewFlowLayout *)collectionViewLayout {
    if (_collectionViewLayout == nil) {
        _collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _collectionViewLayout;
}

@end

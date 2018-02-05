//
//  ViewController.m
//  Example
//
//  Created by ShannonChen on 2018/1/8.
//  Copyright © 2018年 ShannonChen. All rights reserved.
//

#import "ViewController.h"
#import "YHCollectionViewAdapter.h"
#import "SCCutomCollectionViewCell.h"
#import "SCCollectionSectionHeaderView.h"
#import "SCCollectionSectionFooterView.h"

@interface ViewController () <UICollectionViewDelegate, YHCollectionViewAdapterDelegate>

@property (nonatomic, strong) YHCollectionViewAdapter *adapter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"YHListKit";
    
    self.adapter = [[YHCollectionViewAdapter alloc] init];
    self.adapter.collectionView = self.collectionView;    // 绑定 collection view
    self.adapter.collectionViewDelegate = self;           // 设置代理不是必需的，视业务情况而定
    self.adapter.delegate = self;                         // 设置代理不是必需的，视业务情况而定
    
    [self reloadData];
    
}

- (BOOL)pullToRefreshEnabled {
    return YES;
}

- (void)viewDidTriggerRefresh {
    [self reloadData];
}


- (void)reloadData {
    // 更新数据
    NSMutableArray *sections = [NSMutableArray array];
    for (int section = 0; section < 4; section++) {
        
        BOOL hasMultiColumns = section % 2;
        
        // 创建 section model
        YHCollectionViewSectionModel *sectionModel = [[YHCollectionViewSectionModel alloc] init];
        sectionModel.sectionIdentifier = [NSString stringWithFormat:@"section_id_%@", @(section)];  // 设置 section 的唯一标识，可选
        NSMutableArray *rows = [NSMutableArray array];
        for (int row = 0; row < 10; row++) {
            
            // 创建 cell model
            YHCollectionViewCellModel *cellModel = [[YHCollectionViewCellModel alloc] init];
            cellModel.dataModel = [NSString stringWithFormat:@"%i - %i", section, row]; // 设置 model 数据
            cellModel.cellClass = [SCCutomCollectionViewCell class];                    // 设置 cell class
            if (hasMultiColumns) {
                cellModel.cellWidth = 160;
                cellModel.cellHeight = 160;
            } else {
                cellModel.cellHeight = 70;  // 设置 cell 高度，也可以在对应的 cell 中实现相应的协议方法来实现
            }
            
            [rows addObject:cellModel];
        }
        
        sectionModel.cellModels = rows; // 设置该 section 的 cell model 集合
        sectionModel.headerClass = [SCCollectionSectionHeaderView class]; // 设置 section header 的 class
        sectionModel.headerHeight = 50;                                   // 设置 section header 的 高度
        sectionModel.footerClass = [SCCollectionSectionFooterView class]; // 设置 section footer 的 class
        sectionModel.footerHeight = 20;                                   // 设置 section footer 的 高度
        
        if (hasMultiColumns) {
            // 还可以设置 section 的一些布局参数，比如实现一行两列的效果
            sectionModel.sectionInsets = UIEdgeInsetsMake(10, 20, 10, 20);
            sectionModel.minimumLineSpacing = 15;
        }
        
        [sections addObject:sectionModel];
    }
    
    // 传入数据
    self.adapter.sectionModels = sections;
    
    [self.collectionView reloadData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endHeaderRefreshing];
    });
}
    
/**
 设置了 YHCollectionViewAdapter 的 collectionViewDelegate 和 delegate 属性后，就可以实现下面这些方法来做自己想做的事情了
 */

#pragma mark - <UICollectionViewDelegate>
    
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s", __FUNCTION__);
}
    
#pragma mark - <YHCollectionViewAdapterDelegate>
- (void)collectionViewAdapter:(YHCollectionViewAdapter *)adapter didDequeueCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}

@end

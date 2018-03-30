//
//  YHCollectionViewCellModel.h
//  YHOUSE
//
//  Created by ShannonChen on 2017/11/28.
//  Copyright © 2017年 YHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHCollectionViewProtocols.h"

/**
 通用 cell model
 */
@interface YHCollectionViewCellModel : NSObject

@property (strong, nonatomic) Class cellClass;   // class 和 nibName 两个属性必须选择设置其中一个
@property (copy, nonatomic) NSString *nibName;

@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) CGFloat cellWidth;  // 可选字段，默认是 container 的宽度
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) NSInteger numberOfItemsInSection;
@property (strong, nonatomic) id dataModel;

- (void)collectionViewDidSelectItem:(UICollectionView *)collectionView;


@end


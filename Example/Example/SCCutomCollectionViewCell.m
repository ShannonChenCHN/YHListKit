//
//  SCCutomCollectionViewCell.m
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCCutomCollectionViewCell.h"
#import "YHCollectionViewCellModel.h"

@interface SCCutomCollectionViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation SCCutomCollectionViewCell

@synthesize cellModel = _cellModel;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.0) / 255.0
                                               green:arc4random_uniform(255.0) / 255.0
                                                blue:arc4random_uniform(255.0) / 255.0
                                               alpha:1.0];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];

    }
    return self;
}

- (void)setCellModel:(YHCollectionViewCellModel *)cellModel {
    _cellModel = cellModel;
    self.titleLabel.text = cellModel.dataModel;
    
}

//+ (CGFloat)cellWidthWithModel:(YHCollectionViewCellModel *)model {
//    return <#expression#>
//}

//+ (CGFloat)cellHeightWithModel:(YHCollectionViewCellModel *)model {
//    return <#expression#>
//}

@end

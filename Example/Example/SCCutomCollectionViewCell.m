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
        
        self.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];

    }
    return self;
}

- (void)setCellModel:(YHCollectionViewCellModel *)cellModel {
    _cellModel = cellModel;
    self.titleLabel.text = cellModel.dataModel;
    
}

@end

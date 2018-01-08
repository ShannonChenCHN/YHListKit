//
//  SCCollectionSectionHeaderView.m
//  Example
//
//  Created by ShannonChen on 2017/11/17.
//  Copyright © 2017年 ShannonChen. All rights reserved.
//

#import "SCCollectionSectionHeaderView.h"

@interface SCCollectionSectionHeaderView ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation SCCollectionSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont boldSystemFontOfSize:30];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = @"我是 header";
        [self addSubview:_titleLabel];
    }
    return self;
}

@end

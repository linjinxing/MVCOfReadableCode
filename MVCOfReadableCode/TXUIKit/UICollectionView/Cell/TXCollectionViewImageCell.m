//
//  TXCollectionViewImageCell.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "TXCollectionViewImageCell.h"

@interface TXCollectionViewImageCell()
@property(nonatomic, weak) UIImageView* imageView;
@end

@implementation TXCollectionViewImageCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    [self createImageView];
    return self;
}

- (void)createImageView{
    UIImageView* imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    self.imageViewInsets = UIEdgeInsetsZero;
}

- (void)layoutSubviews{
    self.imageView.frame = UIEdgeInsetsInsetRect(self.contentView.bounds, self.imageViewInsets);
}

@end

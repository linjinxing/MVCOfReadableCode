//
//  TXHorizontalCollectionView.m
//  PGShareKit
//
//  Created by linjinxing on 17/1/22.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "TXHorizontalCollectionView.h"

@interface TXHorizontalCollectionView()
@property(nonatomic, weak) UICollectionView* collectionView;
@end

@implementation TXHorizontalCollectionView
@synthesize numberOfItemsInSection, cellForIndexPath, szieForIndexPath;

#pragma mark - 创建子视图并初始化自己

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    return self;
}



- (void)reloadData{
    return [self.collectionView reloadData];
}

#pragma mark - 处理用户事件及传递
/*
 - (void)buttonAction:(id)sender{
 
 }
 */

#pragma mark - 坐标计算及变换
/*
- (void)layoutSubviews{
    
}
 */

#pragma mark - 坐标计算及变换

#pragma mark - 动画，隐藏

#pragma mark - 画图
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark - 动态属性及重写属性

@end

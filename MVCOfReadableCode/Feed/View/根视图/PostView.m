//
//  PGPostView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostView.h"

@interface PostView()
@property(weak)PostContentView* contentView;
@property(weak)PostCommonInputView* commentInputView;
@end

@implementation PostView
@synthesize eventHandler;

#pragma mark - 创建子视图并初始化自己
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.contentView = [self createTableView];
    self.commentInputView = [self createInputView];
    return self;
}


- (PostContentView*) createTableView{
    PostContentView* view = (PostContentView*)[self createAndAddToSelfWithClass:[PostContentView class]
                             backgroundColor:[UIColor brownColor]
                             makeConstraints:^(MASConstraintMaker *make) {
                                 make.top.equalTo(self.mas_top);
                                 make.left.equalTo(self.mas_left);
                                 make.right.equalTo(self.mas_right);
                                 make.height.equalTo(self.mas_height).with.offset([PostInputTextBarView height]);
                             }];
    view.detailView.userInfoView.eventHandler = self.eventHandler;
    return view;
}

- (PostCommonInputView*) createInputView{
    return (PostCommonInputView*)[self createAndAddToSelfWithClass:[PostCommonInputView class]
                                               backgroundColor:[UIColor brownColor]
                                               makeConstraints:^(MASConstraintMaker *make) {
                                                   make.height.mas_equalTo(68);
                                                   make.left.equalTo(self.mas_left);
                                                   make.right.equalTo(self.mas_right);
                                                   make.bottom.equalTo(self.mas_bottom);
                                               }];
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

@end






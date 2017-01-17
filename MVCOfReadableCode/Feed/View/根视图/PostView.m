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
    PostContentView* tv = [[PostContentView alloc] init];
    [self addSubview:tv];
    tv.backgroundColor = [UIColor brownColor];
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.mas_height).with.offset([PostInputTextBarView height]);
    }];
    return tv;
}

- (PostCommonInputView*) createInputView{
    PostCommonInputView* iv = [[PostCommonInputView alloc] init];
    [self addSubview:iv];
    iv.backgroundColor = [UIColor orangeColor];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(68);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    return iv;
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






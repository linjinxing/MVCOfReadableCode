//
//  PGPostPublishUserInfoView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostUserInfoView.h"
#import "ViewEventsParamPOO.h"
#import "PostViewTypes.h"

@interface PostUserInfoView()
@property(weak) UIButton* btnAvatar;
@property(weak) UILabel* lbNickname;
@property(weak) UIButton* btnFollow;
@end

@implementation PostUserInfoView
@synthesize eventHandler;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        @WS
        [self.btnAvatar addTouchUpInsideActionWithBlock:^(id sender) {
            @SS
            self.eventHandler([ViewEventsParamPOO paramWithSender:sender
                                                           events:UIControlEventTouchUpInside]);
        }];
    }
    return self;
}

#pragma mark - 处理用户事件及传递

 - (void)buttonActions:(id)sender{
 
 }


#pragma mark - 坐标计算及变换
/*
 - (void)layoutSubviews{
 
 }
 */

#pragma mark - 坐标计算及变换

#pragma mark - 动画，隐藏

#pragma mark - 画图


@end

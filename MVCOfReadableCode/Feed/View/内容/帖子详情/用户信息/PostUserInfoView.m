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
//@property(weak) UIButton* btnAvatar;
//@property(weak) UILabel* lbNickname;
//@property(weak) UIButton* btnFollow;
@end

@implementation PostUserInfoView
@synthesize eventHandler;

#pragma mark - 动态属性

DynamicProperyForView(btnAvatar, PostViewTagUserInfoProfile)
DynamicProperyForView(btnFollow, PostViewTagUserInfoFollow)
DynamicProperyForView(lbNickname, PostViewTagUserInfoNickname)


#pragma mark - 创建子视图并初始化自己

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubviews];
    }
    return self;
}

- (void)creatSubviews{
    UIButton* btnAvatar = [UIButton systemTypeButtonWithTag:PostViewTagUserInfoProfile];
    [btnAvatar addViewEventsHandler:self.eventHandler];
    
    UIButton* btnFollow = [UIButton systemTypeButtonWithTag:PostViewTagUserInfoFollow];
    [btnFollow addViewEventsHandler:self.eventHandler];
    
    UILabel* lbNickname = [UILabel labelWithTag:PostViewTagUserInfoNickname];
    
    [self addSubviews:btnAvatar, btnFollow, lbNickname, nil];
}

#pragma mark - 处理用户事件及传递
//
// - (void)buttonActions:(id)sender{
// 
// }


#pragma mark - 坐标计算及变换

- (void)layoutSubviews{
    CGFloat space = 8;
//    self.btnAvatar.frame = CGRectMake(space, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}


#pragma mark - 坐标计算及变换

#pragma mark - 动画，隐藏

#pragma mark - 画图


@end

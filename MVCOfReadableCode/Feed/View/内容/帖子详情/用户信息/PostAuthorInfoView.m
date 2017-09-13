//
//  PGPostPublishUserInfoView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostAuthorInfoView.h"
#import "ViewActionParamPOD.h"
#import "PostViewTypes.h"

@interface PostAuthorInfoView()
@property(weak) UIButton* btnAvatar;
@property(weak) UILabel* lbNickname;
@property(weak) UIButton* btnFollow;
@end

@implementation PostAuthorInfoView

#pragma mark - 动态属性
//
//DynamicProperyForView(btnAvatar, PostViewEventHandlerTagUserInfoProfile)
//DynamicProperyForView(btnFollow, PostViewEventHandlerTagUserInfoFollow)
//DynamicProperyForView(lbNickname, PostViewEventHandlerTagUserInfoNickname)


#pragma mark - 创建子视图并初始化自己

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        [self creatSubviews];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
#if 1
    [self.btnFollow addTouchUpInsideActionWithBlock:^(id sender) {
        ViewActionBlock eventsHandlerBlock = [[self parsViewController] viewActionsHandler];
        if (eventsHandlerBlock) {
            eventsHandlerBlock([ViewActionParamPOD paramWithSender:self.btnFollow
                                                               tag:PostViewEventHandlerTagUserInfoFollow]);
        }
    }];
#elif 1
   self.btnFollow.tag = PostViewEventHandlerTagUserInfoFollow;
   [self.btnFollow addTouchUpInsideAction]; 
#else
    [self.btnFollow addTouchUpInsideActionWithTag:PostViewEventHandlerTagUserInfoFollow];
#endif
}

//- (void)creatSubviews{
//    UIButton* btnAvatar = [UIButton systemTypeButtonWithTag:PostViewEventHandlerTagUserInfoProfile];
////    [btnAvatar addViewEventsHandler:self.eventsBlock];
//    
//    UIButton* btnFollow = [UIButton buttonWithTitle:@"关注"
//                                                tag:PostViewEventHandlerTagUserInfoFollow];
//    
//    UILabel* lbNickname = [UILabel labelWithTag:PostViewEventHandlerTagUserInfoNickname];
//    
//    [self addSubviews:btnAvatar, btnFollow, lbNickname, nil];
//    
//    ///// 这段代码和上面的重复，这里只是更好的演示所以这样实现
//    [btnAvatar addTouchUpInsideAction];
//}
#pragma mark - 处理用户事件及传递
//
// - (void)buttonActions:(id)sender{
// 
// }


#pragma mark - 坐标计算及变换

//- (void)layoutSubviews{
//    CGFloat space = TXUILayoutDefaultSpace();
//    
//    CGFloat width = self.height - space * 2;
//    self.btnAvatar.frame = CGRectMake(space, space, width, width);
//    
//    [self.lbNickname sizeToFit];
//    self.lbNickname.centerY = self.centerY;
//    self.lbNickname.left = self.btnAvatar.right + space;
//    
//    [self.btnFollow sizeToFit];
//    self.btnFollow.frame = CGRectMake(self.width - space, space, 80, width);
//}

#pragma mark - 动画，隐藏

#pragma mark - 画图


@end

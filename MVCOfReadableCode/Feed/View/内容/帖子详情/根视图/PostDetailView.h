//
//  PGPostPublishTableHeaderView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  用户发布的信息，包括发布用户的信息，图片，其它用户的点赞。

#import <UIKit/UIKit.h>
#import "PostImagesView.h"
#import "PostUserLikesView.h"
#import "PostUserInfoView.h"

@interface PostDetailView : UIView
@property(readonly, weak)PostUserInfoView* userInfoView;
@property(readonly, weak)PostImagesView* imagesView;
@property(readonly, weak)PostUserLikesView* likesView;
@end

//
//  PGFeedPublishTableHeaderView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  用户发布的信息，包括发布用户的信息，图片，其它用户的点赞。

#import <UIKit/UIKit.h>
#import "PGFeedPublishImagesView.h"
#import "PGFeedPublishLikesView.h"
#import "PGFeedPublishUserInfoView.h"

@interface PGFeedPublishTableHeaderView : UIView
@property(readonly, weak)PGFeedPublishUserInfoView* userInfoView;
@property(readonly, weak)PGFeedPublishImagesView* imagesView;
@property(readonly, weak)PGFeedPublishLikesView* likesView;
@end

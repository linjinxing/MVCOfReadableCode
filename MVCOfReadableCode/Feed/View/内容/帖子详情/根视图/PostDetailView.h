//
//  PGPostPublishTableHeaderView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  用户发布的信息，包括发布用户的信息，图片。

#import <UIKit/UIKit.h>
#import "PostImagesView.h"
#import "PostUserLikesView.h"
#import "PostAuthorInfoView.h"
#import "PostDetailDescView.h"

@interface PostDetailView : UIView
@property(readonly, weak)PostAuthorInfoView* authorInfoView;
@property(readonly, weak)PostImagesView* imagesView;
@property(readonly, weak)PostDetailDescView* descView;

//@property(readonly, weak)PostUserLikesView* likesView;
@end

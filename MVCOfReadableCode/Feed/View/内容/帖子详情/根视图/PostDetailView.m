//
//  PGPostPublishTableHeaderView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostDetailView.h"

@interface PostDetailView()
@property(weak)PostAuthorInfoView* authorInfoView;
@property(weak)PostImagesView* imagesView;
@property(weak)PostUserLikesView* likesView;
@property(weak)PostDetailDescView* descView;
@end

@implementation PostDetailView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end

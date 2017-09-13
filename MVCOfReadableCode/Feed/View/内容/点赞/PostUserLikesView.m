//
//  PGPostPublishLikesView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostUserLikesView.h"
#import "PostViewTypes.h"

@interface PostUserLikesView()
@property(weak) IBOutlet UIButton* btnLike;
@property(weak) UICollectionView* cvlikeAvatars;
@property(weak) IBOutlet UIButton* btnShare;
@end

@implementation PostUserLikesView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.btnLike addTouchUpInsideActionWithTag:PostViewEventHandlerTagActionViewLike];
    [self.btnShare addTouchUpInsideActionWithTag:PostViewEventHandlerTagActionViewShare];
}

@end

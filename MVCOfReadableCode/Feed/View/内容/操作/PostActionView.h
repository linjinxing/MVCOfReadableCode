//
//  PostActionView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewActionsHandler.h"

@interface PostActionView : UIView

@property(readonly, nonatomic, weak) UIButton* btnLike;
//@property(readonly, weak) UIButton* btnAvatar;
//@property(readonly, weak) UIButton* btnMore;
//@property(readonly, weak) UIButton* btnFollow;
/**
 设置是否是点赞状态

 @param yes 如果是点赞状态，则设为yes，否则no

 */
//- (void)setLikeState:(BOOL)yes;
@end

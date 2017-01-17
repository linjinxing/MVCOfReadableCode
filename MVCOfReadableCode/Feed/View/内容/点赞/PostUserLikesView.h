//
//  PGPostPublishLikesView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostUserLikesView : UIView
@property(readonly, weak) UIButton* btnLike;
@property(readonly, weak) UICollectionView* cvlikeAvatars;
@property(readonly, weak) UIButton* btnShare;
@end

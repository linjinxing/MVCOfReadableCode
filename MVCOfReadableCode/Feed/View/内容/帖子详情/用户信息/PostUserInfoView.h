//
//  PGPostPublishUserInfoView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostUserInfoView : UIView
@property(readonly, weak) UIImageView* ivAvatar;
@property(readonly, weak) UILabel* lbNickname;
@property(readonly, weak) UIButton* btnFollow;
@end

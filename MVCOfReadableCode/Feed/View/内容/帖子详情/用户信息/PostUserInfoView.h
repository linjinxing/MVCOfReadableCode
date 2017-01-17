//
//  PGPostPublishUserInfoView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewEventsHandler.h"

@interface PostUserInfoView : UIView<ViewEventsHandler>
@property(readonly, weak) UIButton* btnAvatar;
@property(readonly, weak) UILabel* lbNickname;
@property(readonly, weak) UIButton* btnFollow;
@end

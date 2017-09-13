//
//  PGPostPublishUserInfoView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewActionsHandler.h"

@interface PostAuthorInfoView : UIView
@property(readonly, weak) IBOutlet UIButton* btnAvatar;
@property(readonly, weak) IBOutlet UILabel* lbNickname;
@property(readonly, weak) IBOutlet UIButton* btnFollow;
@end




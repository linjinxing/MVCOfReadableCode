//
//  PGPostTableView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewEventsHandler.h"
#import "PostContentView.h"
#import "PostCommonInputView.h"

typedef NS_ENUM(NSInteger, PGPostTableViewTag) {
    PGPostTableViewTagLikeButton = 1 ,
    PGPostTableViewTagInputEmotionView,
    PGPostTableViewTagShareButton,
};

@interface PostView : UIView<ViewEventHandler>
@property(readonly, weak)PostContentView* contentView;
@property(readonly, weak)PostCommonInputView* commentInputView;
@end



//
//  PGPostTableView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGViewEventsHandler.h"
#import "PGPostTableView.h"
#import "PGPostInputView.h"

typedef NS_ENUM(NSInteger, PGPostTableViewTag) {
    PGPostTableViewTagLikeButton = 1 ,
    PGPostTableViewTagInputEmotionView,
    PGPostTableViewTagShareButton,
};

@interface PGPostView : UIView<PGViewEventHandler>
@property(readonly, weak)PGPostTableView* tableView;
@property(readonly, weak)PGPostInputView* inputView;
@end



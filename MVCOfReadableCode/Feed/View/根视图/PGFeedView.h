//
//  PGFeedTableView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGViewEventsHandler.h"
#import "PGFeedTableView.h"
#import "PGFeedInputView.h"

typedef NS_ENUM(NSInteger, PGFeedTableViewTag) {
    PGFeedTableViewTagLikeView = 1 << 0,
    PGFeedTableViewTagInputEmotionView = 2
};

@interface PGFeedView : UIView<PGViewEventHandler>
@property(readonly, weak)PGFeedTableView* tableView;
@property(readonly, weak)PGFeedInputView* inputView;
@end



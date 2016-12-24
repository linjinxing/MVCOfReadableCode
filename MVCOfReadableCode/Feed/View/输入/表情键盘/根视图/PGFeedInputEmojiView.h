//
//  PGFeedInputEmojiView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  输入表情界面，但是downloadView和emojiPanelView是相斥的，只会有一个界面出现。

#import <UIKit/UIKit.h>
#import "PGFeedInputDownloadEmojiView.h"
#import "PGFeedInputEmojiToolbarView.h"
#import "PGFeedInputEmojiPanelView.h"

@interface PGFeedInputEmojiView : UIView
@property(readonly, weak) PGFeedInputDownloadEmojiView* downloadView;
@property(readonly, weak) PGFeedInputEmojiToolbarView* toolbarView;
@property(readonly, weak) PGFeedInputEmojiPanelView* emojiPanelView;
@end

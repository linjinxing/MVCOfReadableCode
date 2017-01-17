//
//  PGPostInputEmojiView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  输入表情界面，但是downloadView和emojiPanelView是相斥的，只会有一个界面出现。

#import <UIKit/UIKit.h>
#import "PostDownloadEmojiView.h"
#import "PostSwitchEmojiView.h"
#import "PostInputEmojiPanelView.h"

@interface PostInputEmojiView : UIView
@property(readonly, weak) PostDownloadEmojiView* downloadView;
@property(readonly, weak) PostSwitchEmojiView* toolbarView;
@property(readonly, weak) PostInputEmojiPanelView* emojiPanelView;
@end

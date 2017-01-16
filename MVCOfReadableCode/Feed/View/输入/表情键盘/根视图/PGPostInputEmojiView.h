//
//  PGPostInputEmojiView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  输入表情界面，但是downloadView和emojiPanelView是相斥的，只会有一个界面出现。

#import <UIKit/UIKit.h>
#import "PGPostInputDownloadEmojiView.h"
#import "PGPostInputEmojiToolbarView.h"
#import "PGPostInputEmojiPanelView.h"

@interface PGPostInputEmojiView : UIView
@property(readonly, weak) PGPostInputDownloadEmojiView* downloadView;
@property(readonly, weak) PGPostInputEmojiToolbarView* toolbarView;
@property(readonly, weak) PGPostInputEmojiPanelView* emojiPanelView;
@end

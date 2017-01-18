//
//  PGPostInputEmojiView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  输入表情界面，但是downloadView和emojiPanelView是相斥的，只会有一个界面出现。

#import <UIKit/UIKit.h>
#import "TXEmojiKeyboardDownloadEmojiView.h"
#import "TXEmojiKeyboardSwitchEmojiView.h"
#import "TXEmojiKeyboardInputEmojiPanelView.h"

@interface TXEmojiKeyboardEmojiView : UIView
@property(readonly, weak) TXEmojiKeyboardDownloadEmojiView* downloadView;
@property(readonly, weak) TXEmojiKeyboardSwitchEmojiView* switchView;
@property(readonly, weak) TXEmojiKeyboardInputEmojiPanelView* emojiPanelView;
@end




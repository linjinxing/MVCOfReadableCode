//
//  PGFeedInputView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  feed输入界面，包括工具栏和表情输入界面

#import <UIKit/UIKit.h>
#import "PGFeedInputEmojiView.h"
#import "PGFeedInputTextBarView.h"

@interface PGFeedInputView : UIView
@property(readonly, weak) PGFeedInputTextBarView* textBarView;
@property(readonly, weak) PGFeedInputEmojiView* emojiView;
@end

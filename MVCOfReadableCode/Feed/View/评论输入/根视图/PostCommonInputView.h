//
//  PGPostInputView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  feed输入界面，包括工具栏和表情输入界面

#import <UIKit/UIKit.h>
#import "PostInputEmojiView.h"
#import "PostInputTextBarView.h"

@interface PostCommonInputView : UIView
@property(readonly, weak) PostInputTextBarView* textBarView;
@property(readonly, weak) PostInputEmojiView* emojiView;
@end

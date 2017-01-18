//
//  PGPostInputEmojiView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "TXEmojiKeyboardEmojiView.h"

@interface TXEmojiKeyboardEmojiView()
@property(weak) TXEmojiKeyboardDownloadEmojiView* downloadView;
@property(weak) TXEmojiKeyboardSwitchEmojiView* switchView;
@property(weak) TXEmojiKeyboardInputEmojiPanelView* emojiPanelView;
@end

@implementation TXEmojiKeyboardEmojiView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


@end

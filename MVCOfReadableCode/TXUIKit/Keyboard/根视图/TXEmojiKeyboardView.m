//
//  PGPostInputView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "TXEmojiKeyboardView.h"

@interface TXEmojiKeyboardView()
@property(weak) TXEmojiKeyboardInputTextToolbarView* textBarView;
@property(weak) TXEmojiKeyboardEmojiView* emojiView;
@end

@implementation TXEmojiKeyboardView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTextBarViewWithFrame:frame];
        [self initEmojiViewWithFrame:frame];
    }
    return self;
}

- (void)initTextBarViewWithFrame:(CGRect)frame{
    TXEmojiKeyboardInputTextToolbarView* tbv = [[TXEmojiKeyboardInputTextToolbarView alloc] initWithFrame:frame];
    [self addSubview:tbv];
    self.textBarView = tbv;
}

- (void)initEmojiViewWithFrame:(CGRect)frame{
    TXEmojiKeyboardEmojiView* emojiv = [[TXEmojiKeyboardEmojiView alloc] initWithFrame:frame];
    [self addSubview:emojiv];
    self.emojiView = emojiv;
}

- (void)layoutSubviews{
    self.textBarView.top = 0;
    self.textBarView.height = [TXEmojiKeyboardInputTextToolbarView height];
    self.emojiView.top = self.textBarView.bottom;
    self.emojiView.height = self.height - self.textBarView.height;
}


@end

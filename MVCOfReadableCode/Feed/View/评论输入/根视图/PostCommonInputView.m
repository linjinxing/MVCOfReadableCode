//
//  PGPostInputView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostCommonInputView.h"

@interface PostCommonInputView()
@property(weak) PGPostInputTextBarView* textBarView;
@property(weak) PGPostInputEmojiView* emojiView;
@end

@implementation PostCommonInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTextBarViewWithFrame:frame];
        [self initEmojiViewWithFrame:frame];
    }
    return self;
}

- (void)initTextBarViewWithFrame:(CGRect)frame{
    PGPostInputTextBarView* tbv = [[PGPostInputTextBarView alloc] initWithFrame:frame];
    [self addSubview:tbv];
    self.textBarView = tbv;
}

- (void)initEmojiViewWithFrame:(CGRect)frame{
    PGPostInputEmojiView* emojiv = [[PGPostInputEmojiView alloc] initWithFrame:frame];
    [self addSubview:emojiv];
    self.emojiView = emojiv;
}

- (void)layoutSubviews{
    self.textBarView.top = 0;
    self.textBarView.height = [PGPostInputTextBarView height];
    self.emojiView.top = self.textBarView.bottom;
    self.emojiView.height = self.height - self.textBarView.height;
}


@end

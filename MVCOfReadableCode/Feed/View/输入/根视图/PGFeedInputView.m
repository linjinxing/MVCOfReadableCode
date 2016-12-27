//
//  PGFeedInputView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGFeedInputView.h"

@interface PGFeedInputView()
@property(weak) PGFeedInputTextBarView* textBarView;
@property(weak) PGFeedInputEmojiView* emojiView;
@end

@implementation PGFeedInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTextBarViewWithFrame:frame];
        [self initEmojiViewWithFrame:frame];
    }
    return self;
}

- (void)initTextBarViewWithFrame:(CGRect)frame{
    PGFeedInputTextBarView* tbv = [[PGFeedInputTextBarView alloc] initWithFrame:frame];
    [self addSubview:tbv];
    self.textBarView = tbv;
}

- (void)initEmojiViewWithFrame:(CGRect)frame{
    PGFeedInputEmojiView* emojiv = [[PGFeedInputEmojiView alloc] initWithFrame:frame];
    [self addSubview:emojiv];
    self.emojiView = emojiv;
}

- (void)layoutSubviews{
    self.textBarView.top = 0;
    self.textBarView.height = [PGFeedInputTextBarView height];
    self.emojiView.top = self.textBarView.bottom;
    self.emojiView.height = self.height - self.textBarView.height;
}


@end

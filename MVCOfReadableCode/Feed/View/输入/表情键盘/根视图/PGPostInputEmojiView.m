//
//  PGPostInputEmojiView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGPostInputEmojiView.h"

@interface PGPostInputEmojiView()
@property(weak) PGPostInputDownloadEmojiView* downloadView;
@property(weak) PGPostInputEmojiToolbarView* toolbarView;
@property(weak) PGPostInputEmojiPanelView* emojiPanelView;
@end

@implementation PGPostInputEmojiView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


@end

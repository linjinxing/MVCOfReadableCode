//
//  PGFeedInputEmojiView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGFeedInputEmojiView.h"

@interface PGFeedInputEmojiView()
@property(weak) PGFeedInputDownloadEmojiView* downloadView;
@property(weak) PGFeedInputEmojiToolbarView* toolbarView;
@property(weak) PGFeedInputEmojiPanelView* emojiPanelView;
@end

@implementation PGFeedInputEmojiView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


@end

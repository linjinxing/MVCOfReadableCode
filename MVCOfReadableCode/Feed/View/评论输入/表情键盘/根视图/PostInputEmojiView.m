//
//  PGPostInputEmojiView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostInputEmojiView.h"

@interface PostInputEmojiView()
@property(weak) PostDownloadEmojiView* downloadView;
@property(weak) PostSwitchEmojiView* toolbarView;
@property(weak) PostInputEmojiPanelView* emojiPanelView;
@end

@implementation PostInputEmojiView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


@end

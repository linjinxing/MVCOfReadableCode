//
//  PGFeedInputTextBarView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGFeedInputTextBarView.h"

@interface PGFeedInputTextBarView()
@property(weak) UIButton* btnPickImages;
@property(weak) UIButton* btnSwitchKeyboard;
@property(weak) UITextView* textView;
@end

@implementation PGFeedInputTextBarView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.btnPickImages = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return self;
}

@end

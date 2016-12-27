//
//  PGFeedInputTextBarView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGFeedInputTextBarView.h"

static const CGFloat InputViewTextBarHeight = 36.0f;

@interface PGFeedInputTextBarView()
@property(weak) UIButton* btnPickImages;
@property(weak) UIButton* btnSwitchKeyboard;
@property(weak) UITextView* textView;
@end

@implementation PGFeedInputTextBarView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton* btn = [UIButton buttonWithTitle:@"图片"];
        [self addSubview:btn];
        self.btnPickImages = btn;
        
        btn = [UIButton buttonWithTitle:@"表情"];
        [self addSubview:btn];
        self.btnSwitchKeyboard = btn;
        
        UITextView* tv = [[UITextView alloc] init];
        tv.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:tv];
        self.textView = tv;
    }
    return self;
}

- (void)layoutSubviews{
    const CGFloat space = 2;
    const CGFloat buttonWidth = 48;
    self.btnPickImages.frame = CGRectMake(space, space, buttonWidth, self.height - space * 2);
    self.btnSwitchKeyboard.frame = CGRectMake(self.width - space * 2 - buttonWidth, space, buttonWidth, self.height - space * 2);
    
    self.textView.frame = CGRectMake(self.btnPickImages.right + space, space, self.width -  buttonWidth * 2 - space * 4, self.height - space * 2);
}

+ (CGFloat)height{
    return InputViewTextBarHeight;
}
@end

//
//  PGPostInputTextBarView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXEmojiKeyboardInputTextToolbarView : UIView
@property(readonly, weak) UIButton* btnPickImages;
@property(readonly, weak) UIButton* btnSwitchKeyboard;
@property(readonly, weak) UITextView* textView;

+ (CGFloat)height;
@end

//
//  PGPostTableView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewEventsHandler.h"
#import "PostContentView.h"



@interface PostView : UIView<ViewEventsHandler>
@property(readonly, weak)PostContentView* contentView;
@property(readonly, weak)TXEmojiKeyboardView* commentInputView;
@end



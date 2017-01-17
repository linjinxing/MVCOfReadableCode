//
//  PGViewEventProtocol.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "ViewEventsHandler.h"
#import "ViewEventsParamPOO.h"


@implementation UIButton(ViewEventsHandler)
- (void)addViewEventsHandlerWithTag:(NSUInteger)tag
                       eventHandler:(ViewEventsHandler)eventHandler{
    [self addTouchUpInsideActionWithBlock:^(id sender) {
        if (eventHandler) eventHandler([ViewEventsParamPOO paramWithSender:sender
                                                                       tag:tag]);
    }];
}

- (void)addViewEventsHandler:(ViewEventsHandler)eventHandler{
    [self addViewEventsHandlerWithTag:self.tag eventHandler:eventHandler];
}
@end

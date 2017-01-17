//
//  PGViewEventParam.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "ViewEventsParamPOO.h"

@interface ViewEventsParamPOO()
@property(assign) ViewEvents events;
@property(weak) id sender;
@property(strong) id data;
@end

@implementation ViewEventsParamPOO
+ (instancetype)paramWithSender:(id)sender
                         events:(ViewEvents)events
                           data:(id)data{
    ViewEventsParamPOO* param = [[self alloc] init];
    param.events = events;
    param.sender = sender;
    param.data = data;
    return param;
}
@end

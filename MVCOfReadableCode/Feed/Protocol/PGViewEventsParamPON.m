//
//  PGViewEventParam.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGViewEventsParamPON.h"

@interface PGViewEventsParamPON()
@property(assign) PGViewEvents events;
@property(weak) id sender;
@property(strong) id data;
@end

@implementation PGViewEventsParamPON
+ (instancetype)paramWithSender:(id)sender
                                 events:(PGViewEvents)events
                                   data:(id)data{
    PGViewEventsParamPON* param = [[self alloc] init];
    param.events = events;
    param.sender = sender;
    param.data = data;
    return param;
}
@end

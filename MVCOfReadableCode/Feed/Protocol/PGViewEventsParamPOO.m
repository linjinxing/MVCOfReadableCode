//
//  PGViewEventParam.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGViewEventsParamPOO.h"

@interface PGViewEventsParamPOO()
@property(assign) PGViewEvents events;
@property(weak) id sender;
@property(strong) id data;
@end

@implementation PGViewEventsParamPOO
+ (instancetype)paramWithSender:(id)sender
                                 events:(PGViewEvents)events
                                   data:(id)data{
    PGViewEventsParamPOO* param = [[self alloc] init];
    param.events = events;
    param.sender = sender;
    param.data = data;
    return param;
}
@end

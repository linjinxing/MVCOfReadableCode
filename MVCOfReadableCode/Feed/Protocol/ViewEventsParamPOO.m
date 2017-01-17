//
//  PGViewEventParam.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "ViewEventsParamPOO.h"

@interface ViewEventsParamPOO()
@property(assign) UIControlEvents events;
@property(weak) id sender;
@property(strong) id data;
@property(assign) NSUInteger tag;
@end

@implementation ViewEventsParamPOO
+ (instancetype)paramWithSender:(id)sender
                         events:(NSUInteger)events
                           data:(id)data
                            tag:(NSUInteger)tag{
    ViewEventsParamPOO* param = [[self alloc] init];
    param.events = events;
    param.sender = sender;
    param.data = data;
    param.tag = tag;
    return param;
}

+ (instancetype)paramWithSender:(id)sender
                         events:(NSUInteger)events
                            tag:(NSUInteger)tag{
    return [self paramWithSender:sender events:events data:nil tag:tag];
}

+ (instancetype)paramWithSender:(id)sender
                            tag:(NSUInteger)tag{
    return [self paramWithSender:sender events:UIControlEventSystemReserved data:nil tag:tag];
}
@end

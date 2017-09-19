//
//  PGViewActionParam.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "ViewActionParamPOD.h"

@interface ViewActionParamPOD()
@property(assign) UIControlEvents events;
@property(weak) id sender;
@property(strong) id data;
@property(assign) NSUInteger tag;
@property(strong) NSIndexPath* indexPath;
@end

@implementation ViewActionParamPOD
+ (instancetype)paramWithSender:(id)sender
                      indexPath:(NSIndexPath*)indexPath
                         events:(NSUInteger)events
                           data:(id)data
                            tag:(NSUInteger)tag{
    ViewActionParamPOD* param = [[self alloc] init];
    param.indexPath = indexPath;
    param.events = events;
    param.sender = sender;
    param.data = data;
    param.tag = tag;
    return param;
}


+ (instancetype)paramWithSender:(id)sender{
    return [self paramWithSender:sender indexPath:nil events:UIControlEventSystemReserved data:nil tag:[sender tag]];
}


+ (instancetype)paramWithSender:(id)sender
                            tag:(NSUInteger)tag{
    return [self paramWithSender:sender indexPath:nil events:UIControlEventSystemReserved data:nil tag:tag];
}

+ (instancetype)paramWithSender:(id)sender
                      indexPath:(NSIndexPath*)indexPath
                            tag:(NSUInteger)tag{
    return [self paramWithSender:sender indexPath:indexPath events:UIControlEventSystemReserved data:nil tag:tag];
}
+ (instancetype)paramWithSender:(id)sender
                         events:(NSUInteger)events
                            tag:(NSUInteger)tag{
    return [self paramWithSender:sender indexPath:nil events:events data:nil tag:tag];
}

+ (instancetype)paramWithSender:(id)sender
                           data:(id)data
                            tag:(NSUInteger)tag{
    return [self paramWithSender:sender indexPath:nil events:UIControlEventSystemReserved data:data tag:tag];
}

+ (instancetype)paramWithSender:(id)sender
                        events:(NSUInteger)events
                           data:(id)data
                            tag:(NSUInteger)tag{
    return [self paramWithSender:sender indexPath:nil events:events data:data tag:tag];
}
@end




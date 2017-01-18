//
//  PGViewEventParam.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewEventsHandler.h"

@interface ViewEventsParamPOD : NSObject<ViewEventsParam>
+ (instancetype)paramWithSender:(id)sender
                         events:(NSUInteger)events
                           data:(id)data
                            tag:(NSUInteger)tag;

+ (instancetype)paramWithSender:(id)sender
                         events:(NSUInteger)events
                            tag:(NSUInteger)tag;

+ (instancetype)paramWithSender:(id)sender
                         tag:(NSUInteger)tag;
@end

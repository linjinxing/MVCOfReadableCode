//
//  PGViewEventParam.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewEventsHandler.h"

@interface ViewEventsParamPOO : NSObject<ViewEventsParam>
+ (instancetype)paramWithSender:(id)sender
                         events:(ViewEvents)events
                           data:(id)data;
@end

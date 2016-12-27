//
//  PGViewEventParam.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGViewEventsHandler.h"

@interface PGViewEventsParamPOO : NSObject<PGViewEventsParam>
+ (instancetype)paramWithSender:(id)sender
                                 events:(PGViewEvents)events
                                   data:(id)data;
@end

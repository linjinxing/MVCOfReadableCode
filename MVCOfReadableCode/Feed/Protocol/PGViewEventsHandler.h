//
//  PGViewEventProtocol.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  定义view的事件回调协议及UIViewController处理view的事件协议

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "PGViewEventParam.h"

typedef NS_ENUM(NSInteger, PGViewEvents) {
    PGViewEventTouchDown = UIControlEventTouchDown,
    PGViewEventValueChange = UIControlEventValueChanged,
    PGViewEventReloadAllData = 1 << 21
};

@protocol PGViewEventsParam<NSObject>
@property(readonly, weak) id sender;
@property(readonly) PGViewEvents events;
@property(readonly) id data;
@end

typedef void (^PGViewEventHandler)(id<PGViewEventsParam> param);

/* view的事件回调协议, 方便调用统一的事件处理出口，减少代码量 */
@protocol PGViewEventHandler <NSObject>
@property(copy)PGViewEventHandler eventHandler;
@end


/* UIViewController处理view的事件协议，所有要处理view事件的统一入口，
    这样，方便所有的程序员方便找到入口。*/
@protocol PGViewEventHandlerViewController <NSObject>
- (PGViewEventHandler)viewEventHandler;
@end





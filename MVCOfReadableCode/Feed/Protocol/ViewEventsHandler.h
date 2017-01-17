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

//typedef NS_ENUM(NSInteger, ViewEvents) {
//    PGViewEventTouchDown = UIControlEventTouchDown,
//    PGViewEventValueChange = UIControlEventValueChanged,
//    PGViewEventReloadAllData = 1 << 21
//};

@protocol ViewEventsParam<NSObject>
@property(readonly, weak) id sender;
@property(readonly, strong) id data;
@property(readonly, assign) UIControlEvents events;
@property(readonly, assign) NSUInteger tag;
@end

typedef void (^ViewEventsHandler)(id<ViewEventsParam> param);

/* view的事件回调协议, 方便调用统一的事件处理出口，减少代码量，
   同时所有view都这样定义，方便其它同事查找，提高可读性 */
@protocol ViewEventsHandler <NSObject>
@property(nonatomic, copy)ViewEventsHandler eventHandler;
@end


/* UIViewController处理view的事件协议，所有要处理view事件的统一入口，
    这样，方便所有的程序员方便找到入口。*/
@protocol ViewEventHandlerViewController <NSObject>
- (ViewEventsHandler)viewEventHandler;
@end


@interface UIButton(ViewEventsHandler)
- (void)addViewEventsHandlerWithTag:(NSUInteger)tag
                       eventHandler:(ViewEventsHandler)eventHandler;
- (void)addViewEventsHandler:(ViewEventsHandler)eventHandler;
@end







//
//  PGViewActionProtocol.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  定义view的事件回调协议及UIViewController处理view的事件协议

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ViewActionParam<NSObject>
@property(readonly, assign) NSUInteger tag;         /* 标签，必须有，根据此tag查找对应的处理 */
@property(readonly, weak) id sender;                /* 事件发送者 */
@property(readonly, strong) id data;                /* 带的数据，发送者自定义 */
@property(readonly, assign) UIControlEvents events;
@property(readonly, strong) NSIndexPath* indexPath; /* UITableView和UICollectionView要使用，或者其它 */
@end



typedef void (^ViewActionBlock)(id<ViewActionParam> param);

@protocol ViewActionsHandlerViewController <NSObject>
/**
 事件处理分发表，key为tag值，对应于ViewEventsParam的tag，value为block，为对应的处理函数
 
 @return 字典，字典的key是标签，value可以
 */
- (NSDictionary<NSNumber*, id>*)viewActionsHandlerTable;

@end

@interface UIViewController(ViewActionsHandler)
/**
 UIViewController处理view的事件协议，所有要处理view事件的统一入口，
 这样，方便所有的程序员方便找到入口。
 
 @return ViewActionBlock
 */
- (ViewActionBlock)viewActionsHandler;

- (void)handleViewActionsWithTag:(NSInteger)tag;
- (void)handleViewActionsWithSender:(id)sender tag:(NSInteger)tag;
- (void)handleViewActionsWithActionsParam:(id<ViewActionParam>)params;
@end

@interface UIView (FindUIViewController)
- (UIViewController *) parsViewController;
@property(assign, nonatomic) NSInteger parsActionTag;
@end

@interface UIView(SendActionsToController)
- (void)sendActionToController;
- (void)sendActionToControllerWithTag:(NSUInteger)tag;
- (void)sendActionToControllerWithActionsParam:(id<ViewActionParam>)params;
@end

@interface UIButton(SendActionsToController)
- (void)addTouchUpInsideAction;
- (void)addTouchUpInsideActionWithTag:(NSUInteger)tag;
- (void)addTouchUpInsideActionWithActionsParam:(id<ViewActionParam>)params;
//- (void)addViewActionsHandler:(ViewActionBlock)ActionHandler;
@end

@interface UITextField(SendActionsToController)
- (void)addTextDidChangeAction;
- (void)addTextDidChangeActionWithTag:(NSUInteger)tag;
- (void)addTextDidChangeActionWithActionsParam:(id<ViewActionParam>)params;
@end

@interface UITextView(SendActionsToController)
- (void)addTextDidChangeAction;
- (void)addTextDidChangeActionWithTag:(NSUInteger)tag;
- (void)addTextDidChangeActionWithActionsParam:(id<ViewActionParam>)params;
@end

@interface UISwitch(SendActionsToController)
- (void)addValueDidChangeAction;
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag;
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params;
@end


@interface UIPickerView(SendActionsToController)
- (void)addValueDidChangeAction;
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag;
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params;
@end


@interface UIDatePicker(SendActionsToController)
- (void)addValueDidChangeAction;
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag;
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params;
@end

@interface UIProgressView(SendActionsToController)
- (void)addValueDidChangeAction;
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag;
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params;
@end

@interface UISegmentedControl(SendActionsToController)
- (void)addValueDidChangeAction;
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag;
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params;
@end









//
//  PGViewActionProtocol.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <objc/runtime.h>
#import "ViewActionsHandler.h"
#import "ViewActionParamPOD.h"

@interface NSObject (Block)
- (BOOL)_isBlock;
@end

@implementation NSObject (Block)
- (BOOL)_isBlock{
    id block = ^{};
    Class blockClass = [block class];
    while ([blockClass superclass] != [NSObject class]) {
        blockClass = [blockClass superclass];
    }
    return [self isKindOfClass:blockClass];
}
@end

@implementation UIView (FindUIViewController)
- (UIViewController*)parsViewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (NSInteger)parsActionTag{
   return [objc_getAssociatedObject(self, @selector(setParsActionTag:)) integerValue];
}

- (void)setParsActionTag:(NSInteger)parsAction{
    objc_setAssociatedObject(self, @selector(setParsActionTag:), @(parsAction), OBJC_ASSOCIATION_RETAIN);
}

@end

@implementation UIViewController(ViewActionsHandler)

- (ViewActionBlock)viewActionsHandler{
    SEL sel = @selector(viewActionsHandlerTable);
    @weakify(self)
    if (![self respondsToSelector:sel]){
        PGDebugWarn(@"viewActionsHandlerTable not implement for %@", NSStringFromClass([self class]));
        return nil;
    }
    return ^(id<ViewActionParam> param){
        @strongify(self)
        NSDictionary* dict = ((NSDictionary<NSNumber*, id>* (*)(id, SEL))[self methodForSelector:sel])(self, sel);
        id handler = dict[@([param tag])];
        if (nil == handler){
            PGDebugWarn(@"not matched handler for %@", @([param tag]));
        }
        if ([handler isKindOfClass:[NSString class]]){
            SEL selectorHandler = NSSelectorFromString(handler);
            if ([self respondsToSelector:selectorHandler]){
                NSUInteger numberOfArguments = [[self methodSignatureForSelector:selectorHandler] numberOfArguments] - 2;
                if (0 == numberOfArguments) {
                    ((void (*)(id, SEL))[self methodForSelector:selectorHandler])(self, selectorHandler);
                }else if (1 == numberOfArguments) {
                    ((void (*)(id, SEL, id<ViewActionParam>))[self methodForSelector:selectorHandler])(self, selectorHandler, param);
                }else{
                   NSCAssert(false, @"%@类的%@方法参数错误，只支持不带参数或者1个参数，实际参数个数:%@", NSStringFromClass([self class]), handler, @(numberOfArguments));
                }
            }else{
                NSCAssert(false, @"%@未实现%@方法", NSStringFromClass([self class]), handler);
            }
        }else if ([handler _isBlock]){
            ((ViewActionBlock)handler)(param);
        }else{
            NSCAssert(false,@"%@必须是字符串或者block", handler);
        }
    };

}

- (void)handleViewActionsWithTag:(NSInteger)tag{
    [self handleViewActionsWithSender:self tag:tag];
}

- (void)handleViewActionsWithSender:(id)sender
                               tag:(NSInteger)tag{
    [self handleViewActionsWithActionsParam:[ViewActionParamPOD paramWithSender:sender
                                                                          tag:tag]];
}

- (void)handleViewActionsWithActionsParam:(id<ViewActionParam>)params{
    ViewActionBlock block = [self viewActionsHandler];
    if (block) {
        block(params);
    }
}
@end

@implementation UIButton(SendActionsToController)

- (void)addTouchUpInsideAction{
    [self addTouchUpInsideActionWithActionsParam:[ViewActionParamPOD paramWithSender:self
                                                                                tag:self.parsActionTag]];
}

- (void)addTouchUpInsideActionWithTag:(NSUInteger)tag{
    [self addTouchUpInsideActionWithActionsParam:[ViewActionParamPOD paramWithSender:self
                                                                                tag:tag]];
}

- (void)addTouchUpInsideActionWithActionsParam:(id<ViewActionParam>)params{

        [self addTouchUpInsideActionWithBlock:^(UIButton* sender) {
            UIViewController* vc = [sender parsViewController];
            if (vc) {
                ViewActionBlock viewActionsHandler = [vc viewActionsHandler];
                if (viewActionsHandler){
                    viewActionsHandler(params);
                }else{
                    PGDebugWarn(@"!!!![warning], ViewActionBlock not implement");
                }
            }else{
                PGDebugWarn(@"!!!![warning], viewController not found");
            }
        }];
}

- (void)addTouchUpInsideActionWithTag:(NSUInteger)tag
                       ActionHandler:(ViewActionBlock)ActionHandler{
    if (ActionHandler){
        [self addTouchUpInsideActionWithBlock:^(id sender) {
             ActionHandler([ViewActionParamPOD paramWithSender:sender
                                                          tag:tag]);
        }];
    }
}
@end

@implementation UIView(SendActionsToController)
- (void)sendActionToController{
    [self sendActionToControllerWithActionsParam:[ViewActionParamPOD paramWithSender:self
                                                                                 tag:self.parsActionTag]];
}
- (void)sendActionToControllerWithTag:(NSUInteger)tag{
    [self sendActionToControllerWithActionsParam:[ViewActionParamPOD paramWithSender:self
                                                                            tag:tag]];
}
- (void)sendActionToControllerWithActionsParam:(id<ViewActionParam>)params{
    ViewActionBlock block = [self.parsViewController viewActionsHandler];
    if (block) {
        block(params);
    }
}
@end


@implementation UITextField(SendActionsToController)
- (void)addTextDidChangeAction{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSString *>
                                                  paramWithSender:self
                                                  data:self.text
                                                  tag:self.parsActionTag]];
}
- (void)addTextDidChangeActionWithTag:(NSUInteger)tag{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSString *>
                                                  paramWithSender:self
                                                  data:self.text
                                                  tag:tag]];
}
- (void)addTextDidChangeActionWithActionsParam:(id<ViewActionParam>)params
{
    [self sendActionToControllerWithActionsParam:params];
}
@end


@implementation UITextView(SendActionsToController)
- (void)addTextDidChangeAction{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSString *>
                                                  paramWithSender:self
                                                  data:self.text
                                                  tag:self.parsActionTag]];
}
- (void)addTextDidChangeActionWithTag:(NSUInteger)tag{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSString *>
                                                  paramWithSender:self
                                                  data:self.text
                                                  tag:tag]];
}

- (void)addTextDidChangeActionWithActionsParam:(id<ViewActionParam>)params{
    [self sendActionToControllerWithActionsParam:params];
}
@end


@implementation UISwitch(SendActionsToController)
- (void)addValueDidChangeAction{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSNumber *>
                                                  paramWithSender:self
                                                  data:@(self.isOn)
                                                  tag:self.parsActionTag]];
}
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSNumber *>
                                                  paramWithSender:self
                                                  data:@(self.isOn)
                                                  tag:tag]];
}
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params{
    [self sendActionToControllerWithActionsParam:params];
}
@end


@implementation UIPickerView(SendActionsToController)
- (void)addValueDidChangeAction{
    
}
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag{
    
}
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params{
    [self sendActionToControllerWithActionsParam:params];
}
@end


@implementation UIDatePicker(SendActionsToController)
- (void)addValueDidChangeAction{
    [self sendActionToControllerWithActionsParam:[ViewActionParamPOD paramWithSender:self
                                                                                 tag:self.parsActionTag]];
}
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag{
    [self sendActionToControllerWithActionsParam:[ViewActionParamPOD paramWithSender:self
                                                                                 tag:tag]];
}
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params{
    [self sendActionToControllerWithActionsParam:params];
}
@end

@implementation UIProgressView(SendActionsToController)
- (void)addValueDidChangeAction{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSNumber *>
                                                  paramWithSender:self
                                                  data:@(self.progress)
                                                  tag:self.parsActionTag]];
}
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSNumber *>
                                                  paramWithSender:self
                                                  data:@(self.progress)
                                                  tag:tag]];
}
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params{
    [self sendActionToControllerWithActionsParam:params];
}
@end

@implementation UISegmentedControl(SendActionsToController)
- (void)addValueDidChangeAction{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSNumber *>
                                                  paramWithSender:self
                                                  data:@(self.selectedSegmentIndex)
                                                  tag:self.parsActionTag]];
}
- (void)addValueDidChangeActionWithTag:(NSUInteger)tag{
    [self sendActionToControllerWithActionsParam:[ControlActionParamPOD<NSNumber *>
                                                  paramWithSender:self
                                                  data:@(self.selectedSegmentIndex)
                                                  tag:tag]];
}
- (void)addValueDidChangeActionWithActionsParam:(id<ViewActionParam>)params{
    [self sendActionToControllerWithActionsParam:params];
}
@end



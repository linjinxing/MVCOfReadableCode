//
//  UIView+CreateSubviews.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "UIView+Subviews.h"

@implementation UIView (CreateSubviews)
- (UIView*)createAndAddToSelfWithClass:(Class)cls
                       backgroundColor:(UIColor*)backgroundColor
                       makeConstraints:(void(^)(MASConstraintMaker *))block

{
    UIView* view = [[cls alloc] init];
    [self addSubview:view];
    if (backgroundColor) {
        view.backgroundColor = [UIColor brownColor];
    }
    [view mas_makeConstraints:block];
    return view;
}

- (void)addSubviews:(UIView*)firstView, ... NS_REQUIRES_NIL_TERMINATION
{
    @try{
        va_list ap;
        va_start(ap, firstView);
        UIView* view = firstView;
        while (view) {
            if ([view isKindOfClass:[UIView class]]) [self addSubview:view];
            view = va_arg(ap, id);
        }
        va_end(ap);
    }
    @catch(NSException * e) {
        NSLog(@"error:%@", e);
    }
}

@end

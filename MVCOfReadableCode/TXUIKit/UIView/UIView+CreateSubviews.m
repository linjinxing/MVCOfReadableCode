//
//  UIView+CreateSubviews.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "UIView+CreateSubviews.h"

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
}@end

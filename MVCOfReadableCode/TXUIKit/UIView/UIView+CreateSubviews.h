//
//  UIView+CreateSubviews.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CreateSubviews)
/**
 创建cls视图，并添加到self视图

 @param cls 要创建的视图类
 @param backgroundColor <#backgroundColor description#>
 @param block constraint
 @return 返回的视图
 */
- (UIView*)createAndAddToSelfWithClass:(Class)cls
                       backgroundColor:(UIColor*)backgroundColor
                       makeConstraints:(void(^)(MASConstraintMaker *))block;
@end

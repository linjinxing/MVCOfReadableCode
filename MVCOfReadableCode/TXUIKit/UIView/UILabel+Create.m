//
//  UILabel+Create.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "UILabel+Create.h"

@implementation UILabel (Create)
+ (instancetype)labelWithTag:(NSUInteger)tag{
    UILabel* label = [[UILabel alloc] init];
    label.tag = tag;
    return label;
}
@end

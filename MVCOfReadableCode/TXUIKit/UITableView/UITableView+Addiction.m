//
//  UITableView+Addiction.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "UITableView+Addiction.h"

@implementation UITableView (Addiction)
- (void)registerClass:(Class)cellClass{
    [self registerClass:cellClass forCellReuseIdentifier:[cellClass className]];
}
@end

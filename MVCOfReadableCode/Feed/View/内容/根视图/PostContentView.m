//
//  PGPostTableView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostContentView.h"
#import "PGPostPublishTableHeaderView.h"

@interface PostContentView()
@property(readonly, weak) PGPostPublishTableHeaderView* publishTableHeaderView;
@end

@implementation PostContentView

- (PGPostPublishTableHeaderView*) publishTableHeaderView{
    if ([self.tableHeaderView isKindOfClass:[PGPostPublishTableHeaderView class]])  return (PGPostPublishTableHeaderView*)self.tableHeaderView;
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        PGPostPublishTableHeaderView* hv = [[PGPostPublishTableHeaderView alloc] init];
        self.tableHeaderView = hv;
    }
    return self;
}




@end

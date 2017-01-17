//
//  PGPostTableView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostContentView.h"


@interface PostContentView()
@property(weak) PostDetailView* detailView;
@end

@implementation PostContentView

//- (PostDetailView*) detailView{
//    if ([self.tableHeaderView isKindOfClass:[PGPostPublishTableHeaderView class]])  return (PGPostPublishTableHeaderView*)self.tableHeaderView;
//    return nil;
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        PostDetailView* dv = [[PostDetailView alloc] init];
        self.tableHeaderView = dv;
        self.detailView = dv;
    }
    return self;
}




@end

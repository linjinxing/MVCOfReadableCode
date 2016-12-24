//
//  PGFeedTableView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGFeedTableView.h"
#import "PGFeedPublishTableHeaderView.h"

@interface PGFeedTableView()
@property(readonly, weak) PGFeedPublishTableHeaderView* tableHeaderView;
@end

@implementation PGFeedTableView

- (PGFeedPublishTableHeaderView*) tableHeaderView{
    return self.tableHeaderView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        PGFeedPublishTableHeaderView* hv = [[PGFeedPublishTableHeaderView alloc] init];
        self.tableHeaderView = hv;
    }
    return self;
}




@end

//
//  PGFeedView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGFeedView.h"

@interface PGFeedView()
@property(weak)PGFeedTableView* tableView;
@property(weak)PGFeedInputView* inputView;
@end

@implementation PGFeedView
@synthesize eventHandler;
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        PGFeedTableView* tv = [[PGFeedTableView alloc] init];
        [self addSubview:tv];
        self.tableView = tv;
        
        PGFeedInputView* iv = [[PGFeedInputView alloc] init];
        [self addSubview:iv];
        self.inputView = iv;
    }
    return self;
}


//- (PGFeedTableView*) createTableView{
//    PGFeedTableView* tv =
//    return tv;
//}
//@property(weak)PGFeedInputView* inputView;

@end

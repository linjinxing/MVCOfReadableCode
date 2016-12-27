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
    if (!self) return nil;

    self.tableView = [self createTableView];
    self.inputView = [self createInputView];
    return self;
}


- (PGFeedTableView*) createTableView{
    PGFeedTableView* tv = [[PGFeedTableView alloc] init];
    [self addSubview:tv];
    tv.backgroundColor = [UIColor brownColor];
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.mas_height).with.offset([PGFeedInputTextBarView height]);
    }];
    return tv;
}

- (PGFeedInputView*) createInputView{
    PGFeedInputView* iv = [[PGFeedInputView alloc] init];
    [self addSubview:iv];
    iv.backgroundColor = [UIColor orangeColor];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(68);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    return iv;
}

@end

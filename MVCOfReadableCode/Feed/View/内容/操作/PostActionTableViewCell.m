//
//  PostActionTableViewCell.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "PostActionTableViewCell.h"

@interface PostActionTableViewCell()
@property(nonatomic, weak) PostActionView* actionView;
@end

@implementation PostActionTableViewCell
@synthesize eventsBlock;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

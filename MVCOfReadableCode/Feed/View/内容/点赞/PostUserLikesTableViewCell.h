//
//  PostUserLikesTableViewCell.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostUserLikesView.h"

@interface PostUserLikesTableViewCell : UITableViewCell
@property(nonatomic, readonly, weak) PostUserLikesView* likesView;
@end

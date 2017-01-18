//
//  PostActionTableViewCell.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostActionView.h"

@interface PostActionTableViewCell : UITableViewCell<ViewEventsHandler>
@property(nonatomic, readonly, weak) PostActionView* actionView;
@end

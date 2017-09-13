//
//  PGPostTableView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//  显示用户发布的图片和用户对它的feed

#import <UIKit/UIKit.h>
#import "PostDetailView.h"
#import "PostActionTableViewCell.h"
#import "PostCommentTableViewCell.h"
#import "PostUserLikesTableViewCell.h"

@interface PostContentView : UITableView
@property(nonatomic, weak, readonly) IBOutlet PostDetailView* detailView;
@end



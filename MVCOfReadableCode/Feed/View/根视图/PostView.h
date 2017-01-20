//
//  PGPostTableView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewEventsHandler.h"
#import "PostContentView.h"
#import "Post.h"


@interface PostView : UIView<ViewEventsHandler>
@property(readonly, weak)PostContentView* contentView;
@property(readonly, weak)TXEmojiKeyboardView* commentInputView;
@property(weak)id<UITableViewDataSource,UICollectionViewDataSource,TXImageViewDataSource> dataSource;
@property(weak)id<UITableViewDelegate,UICollectionViewDelegate,TXImageViewDelegate> delegate;
/**
 加载所有数据
 @param post post 帖子数据对象
 */
- (void)reloadAllWithPost:(id<Post>) post;
/**
 只更新评论
 */
- (void)reloadComments;
/**
 更新帖子相关界面
 @param post post 帖子数据对象
 */
- (void)reloadPostCotentWithPost:(id<Post>) post;
@end





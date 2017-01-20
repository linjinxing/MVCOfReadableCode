//
//  PGPostView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostView.h"
#import "PostViewTypes.h"

@interface PostView()
@property(weak)PostContentView* contentView;
@property(weak)TXEmojiKeyboardView* commentInputView;
@end

@implementation PostView
@synthesize eventsBlock;

#pragma mark - 创建子视图并初始化自己
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.contentView = [self createTableView];
    self.commentInputView = [self createInputView];
    return self;
}


- (PostContentView*) createTableView{
    PostContentView* view = (PostContentView*)[self createAndAddToSelfWithClass:[PostContentView class]
                             backgroundColor:[UIColor brownColor]
                             makeConstraints:^(MASConstraintMaker *make) {
                                 make.top.equalTo(self.mas_top);
                                 make.left.equalTo(self.mas_left);
                                 make.right.equalTo(self.mas_right);
                                 make.height.equalTo(self.mas_height).with.offset([TXEmojiKeyboardInputTextToolbarView height]);
                             }];
    view.detailView.userInfoView.eventsBlock = self.eventsBlock;
    return view;
}

- (TXEmojiKeyboardView*) createInputView{
    return (TXEmojiKeyboardView*)[self createAndAddToSelfWithClass:[TXEmojiKeyboardView class]
                                               backgroundColor:[UIColor brownColor]
                                               makeConstraints:^(MASConstraintMaker *make) {
                                                   make.height.mas_equalTo(68);
                                                   make.left.equalTo(self.mas_left);
                                                   make.right.equalTo(self.mas_right);
                                                   make.bottom.equalTo(self.mas_bottom);
                                               }];
}

- (void)reloadAllWithPost:(id<Post>) post{
    [self reloadComments];
    [self reloadPostCotentWithPost:post];
}

/**
 只更新评论
 */
- (void)reloadComments{
    [self.contentView reloadSections:[NSIndexSet indexSetWithIndex:PostViewTableViewSectionIndexComments]
                             withRowAnimation:UITableViewRowAnimationFade];
}
/**
 更新帖子相关界面
 */
- (void)reloadPostCotentWithPost:(id<Post>) post{
    [self.contentView.detailView.userInfoView.btnAvatar sd_setBackgroundImageWithURL:post.author.avatarURL
                                                                                     forState:UIControlStateNormal];
    self.contentView.detailView.userInfoView.lbNickname.text = post.author.nickName;
    [self.contentView reloadSections:[NSIndexSet indexSetWithIndex:PostViewTableViewSectionIndexLikeUsers]
                             withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - 数据源和代理处理
- (void)setDelegate:(id<UITableViewDelegate,UICollectionViewDelegate,TXImageViewDelegate>)delegate{
    _delegate = delegate;
    self.contentView.detailView.descView.cvTags.delegate = delegate;
    self.contentView.detailView.imagesView.delegate = delegate;
}

- (void)setDataSource:(id<UITableViewDataSource,UICollectionViewDataSource,TXImageViewDataSource>)dataSource{
    _dataSource = dataSource;
    self.contentView.detailView.imagesView.dataSource = dataSource;
    self.contentView.detailView.descView.cvTags.dataSource = dataSource;
}

#pragma mark - 处理用户事件及传递
/*
 - (void)buttonAction:(id)sender{
 
 }
 */

#pragma mark - 坐标计算及变换
/*
- (void)layoutSubviews{
    
}
 */

#pragma mark - 坐标计算及变换

#pragma mark - 动画，隐藏

#pragma mark - 画图

@end






//
//  PGPostViewController.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostViewController.h"
#import "PostView.h"
#import "Post.h"
#import "PostBLL.h"
#import "PostViewTypes.h"
#import "Comment.h"

@interface PostViewController ()<ViewEventHandlerViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) PostView *feedView;
@property (nonatomic, strong) NSArray<id<Comment>>* comments;
@property (nonatomic, strong) id<Post> post;
@end

@implementation PostViewController

#pragma mark - 动态属性及重写属性

#pragma mark - 生命周期管理

- (void)loadView{
    PostView* view = [[PostView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.eventHandler = [self viewEventHandler];
    self.view = view;
    self.feedView = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 界面跳转
- (void)showShareViewController{
    NSLog(@"显示分享资料界面");
}

- (void)showUserProfileViewControllerWithUser:(id<User>)user{
    NSLog(@"显示用户资料界面");
}

- (void)showSignInViewController{
    NSLog(@"显示登录界面");
}

- (void)showImagesBrowserViewController{
    NSLog(@"显示图片大图浏览界面");
}


#pragma mark - 视图（View）用户事件响应
- (ViewEventsHandler)viewEventHandler{
    NSDictionary<NSNumber *, ViewEventsHandler>* handleTable = @{
                                                   @(PostViewTagActionViewLike):[self likeViewEventHandler],
                                                   @(PostViewTagEmojiInputView):[self inputEmotionViewEventHandler],
                                                   @(PostViewTagUserInfoProfile):[self showUserProfileEventHandler],
                                                   @(PostViewTagCommentTableViewCellMore):[self commentMoreEventHandler],
                                                   };
    return ^(id<ViewEventsParam> param){
        ViewEventsHandler handler = handleTable[@([param.sender tag])];
        if (handler) handler(param);
        else PGDebugWarn(@"not matched handler for %@", @([param.sender tag]));
    };
}

- (ViewEventsHandler)likeViewEventHandler{
    return ^(id<ViewEventsParam> param){
        NSLog(@"处理点赞事件");
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [[PostBLLLike(self.post.id)
         deliverOnMainThread]
         subscribeError:^(NSError *error) {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
        } completed:^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    };
}

- (ViewEventsHandler)inputEmotionViewEventHandler{
    return ^(id<ViewEventsParam> param){
        NSLog(@"处理表情输入");
    };
}

- (ViewEventsHandler)showUserProfileEventHandler{
    return ^(id<ViewEventsParam> param){
        [self showUserProfileViewControllerWithUser:[self.post user]];
        NSLog(@"处理显示用户简介");
    };
}

- (ViewEventsHandler)commentMoreEventHandler{
    return ^(id<ViewEventsParam> param){
        NSLog(@"处理评论点赞");
    };
}

#pragma mark - 数据模型（Model）和V的交互

#pragma mark 点赞 collection view delegate

#pragma mark 点赞 collection view dataSource

#pragma mark 图片 collection view delegate

#pragma mark 图片 collection view dataSource

#pragma mark collection view delegate

#pragma mark collection view dataSource



#pragma mark  table view dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return PostViewTableViewSectionIndexComments == section ? self.comments.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView dequeueReusableCellWithIdentifier:@{
                                                          @(PostViewTableViewSectionIndexActionTag):[PostActionTableViewCell className],
                                                          @(PostViewTableViewSectionIndexComments):[PostCommentTableViewCell className],
                                                          @(PostViewTableViewSectionIndexLikeUsers):[PostUserLikesTableViewCell className]
                                                          }[@(indexPath.section)]];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    void (^setEventHandler)(Class) = ^(Class cellClass){
        NSAssert([cell isKindOfClass:[PostActionTableViewCell class]], [@"必须是" stringByAppendingString:[cellClass className]]);
        ((PostActionTableViewCell*)cell).eventHandler = self.viewEventHandler;
    };
    switch (indexPath.section) {
        case PostViewTableViewSectionIndexActionTag: setEventHandler([PostActionTableViewCell class]); break;
        case PostViewTableViewSectionIndexLikeUsers: setEventHandler([PostUserLikesTableViewCell class]); break;
        case PostViewTableViewSectionIndexComments:
        {
            NSAssert([cell isKindOfClass:[PostCommentTableViewCell class]], @"必须是PostCommentTableViewCell");
            PostCommentTableViewCell* commentCell = (PostCommentTableViewCell*)cell;
            commentCell.eventHandler = self.viewEventHandler;
            [commentCell.imageView sd_setHighlightedImageWithURL:[[self.comments[indexPath.row] user] imageURL]];
            commentCell.textLabel.text = [self.comments[indexPath.row] content];
            break;
        }
        default:
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return PostViewTableViewSectionCount;
}

#pragma mark  table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}







@end








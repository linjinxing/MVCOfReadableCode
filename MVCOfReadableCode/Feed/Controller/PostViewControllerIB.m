//
//  PostViewControllerIB.m
//  MVCOfReadableCode
//
//  Created by 林金星 on 28/05/2017.
//  Copyright © 2017 linjinxing. All rights reserved.
//

#import "PostViewControllerIB.h"
#import "PostView.h"
#import "Post.h"
#import "PostBLL.h"
#import "PostViewTypes.h"
#import "Comment.h"
#import "CommentBLL.h"

@interface PostViewControllerIB ()
/**
 替换controller.view
 */
@property (nonatomic, weak) PostView *postView;
/**
 包含评论信息
 */
@property (nonatomic, strong) NSArray<id<Comment>>* comments;
/**
 包含帖子信息
 */
@property (nonatomic, strong) id<Post> post;
@end

@implementation PostViewControllerIB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图（View）事件响应
- (NSDictionary<NSNumber*, id>*) viewEventsHandlerTable{
    return @{
             @(PostViewEventHandlerTagUserInfoFollow):PASelectorToString(followViewEventHandler:),
             @(PostViewEventHandlerTagActionViewLike):[self likeViewEventHandler],
             @(PostViewEventHandlerTagEmojiInputView):[self inputEmotionViewEventHandler],
             @(PostViewEventHandlerTagUserInfoProfile):[self showUserProfileEventHandler],
             @(PostViewEventHandlerTagCommentTableViewCellMore):[self commentMoreEventHandler],
             @(PostViewEventHandlerTagActionViewShare):PASelectorToString(showShareViewController),
             @(PostViewEventHandlerTagImagesView):^(id<ViewActionParam> param){
                 [self showImagesBrowserViewControllerWithStartIndex:param.indexPath.item];
             },
             @(PostViewTableViewCellLikeUsers):^(id<ViewActionParam> param){
                 [self showUserProfileViewControllerWithUser:self.post.likeUsers[param.indexPath.item]];
             },
             };
}


- (ViewActionBlock)likeViewEventHandler{
    return ^(id<ViewActionParam> param){
        NSLog(@"处理帖子点赞事件");
        PostActionTableViewCell* cell = [self.postView.contentView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:PostViewTableViewSectionIndexLikeUsers]];
        [[[PostBLLLike(self.post.id)
           showAllWithSuccessMessage:@"点赞成功"]
          deliverOnMainThread]
         subscribeCompleted:^{
             [cell.actionView.btnLike setTitle:@"已赞" forState:UIControlStateNormal];
         }];
    };
}

- (ViewActionBlock)inputEmotionViewEventHandler{
    return ^(id<ViewActionParam> param){
        NSLog(@"处理表情输入");
    };
}

- (ViewActionBlock)showUserProfileEventHandler{
    return ^(id<ViewActionParam> param){
        [self showUserProfileViewControllerWithUser:self.post.author];
        NSLog(@"处理显示用户简介");
    };
}

- (ViewActionBlock)commentMoreEventHandler{
    return ^(id<ViewActionParam> param){
        NSLog(@"处理点击评论的更多");
    };
}


- (void)followViewEventHandler:(id<ViewActionParam>) param{
    NSLog(@"处理关注事件");
};

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

- (void)showImagesBrowserViewControllerWithStartIndex:(NSUInteger)index{
    NSLog(@"显示图片大图浏览界面");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

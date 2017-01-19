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

@interface PostViewController ()<ViewEventHandlerViewController, TXImageViewDelegate, TXImageViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) PostView *postView;
@property (nonatomic, strong) NSArray<id<Comment>>* comments;
@property (nonatomic, strong) id<Post> post;
@end

@implementation PostViewController

#pragma mark - 动态属性及重写属性

#pragma mark - 生命周期管理

- (void)loadView{
    PostView* view = [[PostView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.eventHandler = [self viewEventHandler];
    view.contentView.detailView.descView.cvTags.dataSource = self;
    view.contentView.detailView.descView.cvTags.delegate = self;
    view.contentView.detailView.imagesView.dataSource = self;
    view.contentView.detailView.imagesView.delegate = self;
    self.view = view;
    self.postView = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}

#pragma mark - 加载数据
- (void)loadData{
    [[PostBLLRequest()
      showAllMessage]
     subscribeNext:^(id x) {
         self.post = x;
         [self refreshAllData];
     }];
    
    WeakSelf
    [[PostBLLObserveChange()
      takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(id x) {
         NSLog(@"帖子数据发生变化");
         StrongSelf
         self.post = x;
         [self refreshAllData];
     }];
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

- (void)showImagesBrowserViewControllerWithStartIndex:(NSUInteger)index{
    NSLog(@"显示图片大图浏览界面");
}


#pragma mark - 视图（View）用户事件响应
- (ViewEventsHandler)viewEventHandler{
    NSDictionary<NSNumber *, ViewEventsHandler>* handleTable = @{
                                                   @(PostViewEventHandlerTagActionViewLike):[self likeViewEventHandler],
                                                   @(PostViewEventHandlerTagEmojiInputView):[self inputEmotionViewEventHandler],
                                                   @(PostViewEventHandlerTagUserInfoProfile):[self showUserProfileEventHandler],
                                                   @(PostViewEventHandlerTagCommentTableViewCellMore):[self commentMoreEventHandler],
                                                   @(PostViewEventHandlerTagImagesView):^(id<ViewEventsParam> param){
                                                       [self showImagesBrowserViewControllerWithStartIndex:param.indexPath.item];
                                                   },
                                                   @(PostViewTableViewCellLikeUsers):^(id<ViewEventsParam> param){
                                                       [self showUserProfileViewControllerWithUser:self.post.likeUsers[param.indexPath.item]];
                                                   },
                                                   };
    return ^(id<ViewEventsParam> param){
        ViewEventsHandler handler = handleTable[@([param.sender tag])];
        if (handler) handler(param);
        else PGDebugWarn(@"not matched handler for %@", @([param.sender tag]));
    };
}

- (ViewEventsHandler)likeViewEventHandler{
    return ^(id<ViewEventsParam> param){
        NSLog(@"处理帖子点赞事件");
        PostActionTableViewCell* cell = [self.postView.contentView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:PostViewTableViewSectionIndexLikeUsers]];
        [[[PostBLLLike(self.post.id)
           showAllWithSuccessMessage:cell.actionView.likesState?@"取消点赞成功":@"点赞成功"]
          deliverOnMainThread]
         subscribeCompleted:^{
             cell.actionView.likesState = !cell.actionView.likesState;
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
        [self showUserProfileViewControllerWithUser:self.post.author];
        NSLog(@"处理显示用户简介");
    };
}

- (ViewEventsHandler)commentMoreEventHandler{
    return ^(id<ViewEventsParam> param){
        NSLog(@"处理点击评论的更多");
    };
}

#pragma mark - 数据模型（Model）和V的交互
- (void)refreshPostAuthorView{
    [self.postView.contentView.detailView.userInfoView.btnAvatar sd_setBackgroundImageWithURL:self.post.author.avatarURL
                                                                                     forState:UIControlStateNormal];
    self.postView.contentView.detailView.userInfoView.lbNickname.text = self.post.author.nickName;
}

- (void)refreshAllData{
    [self.postView reloadAllData];
    [self.postView.contentView.detailView.userInfoView.btnAvatar sd_setBackgroundImageWithURL:self.post.author.avatarURL
                                                                                     forState:UIControlStateNormal];
    self.postView.contentView.detailView.userInfoView.lbNickname.text = self.post.author.nickName;
}

//#pragma mark 点赞用户 collection view delegate
//
//#pragma mark 点赞用户 collection view dataSource

#pragma mark 图片 view delegate
- (void)imageView:(UIView*)imageView didSelectItemAtIndexPath:(NSIndexPath*)indexPath{
    [self showImagesBrowserViewControllerWithStartIndex:indexPath.item];
}

#pragma mark 图片 view dataSource
- (UIImage*)iamgeView:(UIView*)imageView imageForIndexPath:(NSIndexPath*)indexPath{
#warning 这里只是示例，这样可能有bug
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:[self.post imageURLs][indexPath.item]]];
}

- (NSInteger)imageView:(UIView*)imageView numberOfItemsInSection:(NSInteger)section{
    return [[self.post imageURLs] count];
}

#pragma mark collection view delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self viewEventHandler]([ViewEventsParamPOD paramWithSender:[collectionView cellForItemAtIndexPath:indexPath]
                                                      indexPath:indexPath
                                                            tag:(PostViewCollectionViewTagLikeUsers == collectionView.tag ? PostViewTableViewCellLikeUsers : PostViewEventHandlerTagImagesView)]);
}

#pragma mark collection view dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    assert(PostViewCollectionViewTagLikeUsers == collectionView.tag
           || PostViewCollectionViewTagDescription == collectionView.tag);
    return (PostViewCollectionViewTagLikeUsers == collectionView.tag ? self.post.likeUsers.count : self.post.tags.count);
//  @{
//             @(PostViewCollectionViewTagLikeUsers):[ count]
//             }[@(collectionView.tag)];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    assert(PostViewCollectionViewTagLikeUsers == collectionView.tag
           || PostViewCollectionViewTagDescription == collectionView.tag);
    if (PostViewCollectionViewTagLikeUsers == collectionView.tag) {
        assert(indexPath.item < self.post.likeUsers.count);
        TXCollectionViewImageCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TXCollectionViewImageCell className] forIndexPath:indexPath];
        [cell.imageView sd_setHighlightedImageWithURL:[[self.post likeUsers][indexPath.item] avatarURL]];
        return cell;
    }else{
        assert(indexPath.item < self.post.tags.count);
        TXCollectionViewTitleLabelCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TXCollectionViewTitleLabelCell className] forIndexPath:indexPath];
        cell.titleLabel.text = [self.post tags][indexPath.item];
        return cell;
    }
//    return [collectionView dequeueReusableCellWithReuseIdentifier:(PostViewCollectionViewTagLikeUsers == collectionView.tag ? [TXCollectionViewImageCell className] : [TXCollectionViewTitleLabelCell className])
//                                                     forIndexPath:indexPath] ;
}



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
    void (^asserCell)(Class) = ^(Class cellClass){
        NSAssert([cell isKindOfClass:[cellClass class]], [@"必须是" stringByAppendingString:[cellClass className]]);
    };
    switch (indexPath.section) {
        case PostViewTableViewSectionIndexActionTag: {
            asserCell([PostActionTableViewCell class]);
            ((PostActionTableViewCell*)cell).eventHandler = self.viewEventHandler;
            break;
        }
        case PostViewTableViewSectionIndexLikeUsers: {
            asserCell([PostUserLikesTableViewCell class]);
            ((PostUserLikesTableViewCell*)cell).likesView.cvlikeAvatars.delegate = self;
            ((PostUserLikesTableViewCell*)cell).likesView.cvlikeAvatars.dataSource = self;
            break;
        }
        case PostViewTableViewSectionIndexComments:
        {
            asserCell([PostCommentTableViewCell class]);
            PostCommentTableViewCell* commentCell = (PostCommentTableViewCell*)cell;
            commentCell.eventHandler = self.viewEventHandler;
            [commentCell.imageView sd_setHighlightedImageWithURL:[[self.comments[indexPath.row] author] avatarURL]];
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








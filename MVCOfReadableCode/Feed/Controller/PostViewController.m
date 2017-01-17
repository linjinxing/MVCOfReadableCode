//
//  PGPostViewController.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostViewController.h"
#import "PostView.h"
#import "PGPostModel.h"
#import "PostViewTypes.h"

@interface PostViewController ()<ViewEventHandlerViewController>
@property (nonatomic, weak) PostView *feedView;
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

- (void)showUserProfileViewController{
    NSLog(@"显示用户资料界面");
}

- (void)showSignInViewController{
    NSLog(@"显示登录界面");
}

#pragma mark - 视图（View）交互
- (ViewEventsHandler)viewEventHandler{
    NSDictionary<NSNumber *, ViewEventsHandler>* handleTable = @{
                                                   @(PostViewTagLikeButton):[self likeViewEventHandler],
                                                   @(PostViewTagInputEmotionView):[self inputEmotionViewEventHandler]
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
    };
}

- (ViewEventsHandler)inputEmotionViewEventHandler{
    return ^(id<ViewEventsParam> param){
        NSLog(@"处理表情输入");
    };
}

#pragma mark - 数据模型（Model）和V的交互

#pragma mark 点赞 collection view delegate

#pragma mark 点赞 collection view dataSource

#pragma mark 图片 collection view delegate

#pragma mark 图片 collection view dataSource

#pragma mark 评论 table view delegate

#pragma mark 评论 table view dataSource









@end








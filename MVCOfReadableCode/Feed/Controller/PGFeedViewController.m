//
//  PGFeedViewController.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGFeedViewController.h"
#import "PGFeedView.h"

@interface PGFeedViewController ()<PGViewEventHandlerViewController>
@property (nonatomic, weak) PGFeedView *feedView;
@end

@implementation PGFeedViewController

#pragma mark - 生命周期管理


- (void)loadView{
    PGFeedView* view = [[PGFeedView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
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

#pragma mark - 转场

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)showSignInViewController{
    NSLog(@"显示登录界面");
}

#pragma mark - 视图（View）交互
- (PGViewEventHandler)viewEventHandler{
    NSDictionary<NSNumber *, PGViewEventHandler>* handleTable = @{
                                                   @(PGFeedTableViewTagLikeButton):[self likeViewEventHandler],
                                                   @(PGFeedTableViewTagInputEmotionView):[self inputEmotionViewEventHandler]
                                                   };
    return ^(id<PGViewEventsParam> param){
        PGViewEventHandler handler = handleTable[@([param.sender tag])];
        if (handler) handler(param);
    };
}

- (PGViewEventHandler)likeViewEventHandler{
    return ^(id<PGViewEventsParam> param){
        NSLog(@"处理点赞事件");
    };
}

- (PGViewEventHandler)inputEmotionViewEventHandler{
    return ^(id<PGViewEventsParam> param){
        NSLog(@"处理表情输入");
    };
}

#pragma mark - 数据模型（Model）交互

@end








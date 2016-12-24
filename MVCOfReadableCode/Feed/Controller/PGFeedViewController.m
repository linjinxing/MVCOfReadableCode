//
//  PGFeedViewController.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PGFeedViewController.h"
#import "PGFeedTableView.h"

@interface PGFeedTableViewController ()<PGViewEventHandlerViewController>
@property (nonatomic, strong, null_resettable) PGFeedTableView *tableView;
@end

@implementation PGFeedTableViewController
@dynamic tableView;
#pragma mark - 生命周期管理

- (PGFeedTableView *)tableView{
    return (PGFeedTableView*)[self view];
}

- (void)loadView{
    PGFeedTableView* tv = [[PGFeedTableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    tv.eventHandler = [self viewEventHandler];
    self.view = tv;
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
                                                   @(PGFeedTableViewTagLikeView):[self likeViewEventHandler],
                                                   @(PGFeedTableViewTagInputEmotionView):[self inputEmotionViewEventHandler]
                                                   };
    return ^(id<PGViewEventsParam> param){
        PGViewEventHandler handler = handleTable[@([param.sender tag])];
        if (handler) handler(param);
    };
}

- (PGViewEventHandler)likeViewEventHandler{
    return ^(id<PGViewEventsParam> param){
        
    };
}

- (PGViewEventHandler)inputEmotionViewEventHandler{
    return ^(id<PGViewEventsParam> param){
        
    };
}

#pragma mark - 数据模型（Model）交互

@end








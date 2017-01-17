//
//  PostActionView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/17.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "PostActionView.h"
#import "PostViewTypes.h"

@interface PostActionView()
@property(nonatomic, weak) UIButton* btnLike;
@property(nonatomic, weak) UIButton* btnMore;
@property(nonatomic, weak) UIButton* btnAddComment;
@end

@implementation PostActionView
@synthesize eventHandler;


#pragma mark - 动态属性及重写属性

- (void)setEventHandler:(ViewEventsHandler)aEventHandler{
    eventHandler = [aEventHandler copy];
    [@[self.btnLike, self.btnAddComment, self.btnMore]
     enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         [obj addViewEventsHandler:self.eventHandler];
     }];
}

DynamicProperyForView(btnLike, PostActionViewLike)
DynamicProperyForView(btnAddComment, PostActionViewAddComment)
DynamicProperyForView(btnMore, PostActionViewMore)

#pragma mark - 创建子视图并初始化自己

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [@[@{TXUIDictionaryKeyTag:@(PostActionViewLike),TXUIDictionaryKeyTitle:@"赞"},
           @{TXUIDictionaryKeyTag:@(PostActionViewAddComment),TXUIDictionaryKeyTitle:@"评论"},
           @{TXUIDictionaryKeyTag:@(PostActionViewMore),TXUIDictionaryKeyTitle:@"..."},]
         enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
             UIButton* btn = [UIButton buttonWithTitle:obj[TXUIDictionaryKeyTitle]
                                                   tag:[obj integerValue]];
            [btn addViewEventsHandler:self.eventHandler];
            [self addSubview:btn];
        }];
    }
    return self;
}

#pragma mark - 坐标计算及变换

- (void)layoutSubviews{
    CGFloat space = TXUILayoutDefaultSpace();
    
    CGFloat width = TXUILayoutDefaultButtonWidth();
    CGFloat heigth = self.height - space * 2;
    
    self.btnLike.frame = CGRectMake(space, space, width, heigth);
    self.btnAddComment.frame = CGRectMake(self.btnLike.right + space * 2, space, width, heigth);
    self.btnMore.frame = CGRectMake(self.width - space, space, width, heigth);
}

@end

//
//  PGPostTableView.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import "PostContentView.h"
//#import "TXCollectionViewImageCell.h"


@interface PostContentView()
@property(weak) PostDetailView* detailView;
@end

@implementation PostContentView

//- (PostDetailView*) detailView{
//    if ([self.tableHeaderView isKindOfClass:[PGPostPublishTableHeaderView class]])  return (PGPostPublishTableHeaderView*)self.tableHeaderView;
//    return nil;
//}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        PostDetailView* dv = [[PostDetailView alloc] initWithFrame:self.bounds];
        self.tableHeaderView = dv;
        self.detailView = dv;
        [self registerClass:[PostActionTableViewCell class]];
        [self registerClass:[PostCommentTableViewCell class]];
        [self registerClass:[PostUserLikesTableViewCell class]];
    }
    return self;
}




@end

//
//  CommentPOD.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "Comment.h"

@implementation CommentPOD

- (NSString*)content{
    return @"嘻嘻";
}

- (id<User>)author{
    return [UserPOD new];
}


@end

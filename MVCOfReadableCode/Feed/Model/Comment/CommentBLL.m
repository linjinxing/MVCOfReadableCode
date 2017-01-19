//
//  CommentModel.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "CommentBLL.h"
#import "Comment.h"


RACSignal* CommentBLLLoad(){
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@[[CommentPOD new], [CommentPOD new], [CommentPOD new]]];
        return nil;
    }];
}




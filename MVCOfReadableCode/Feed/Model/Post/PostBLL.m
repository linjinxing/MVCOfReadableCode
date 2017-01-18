//
//  PostModel.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "PostBLL.h"
#import "Post.h"

RACSignal* PostBLLRequest(){
    return [RACSignal return:[PostPOD new]];
}

RACSignal* PostBLLLike(NSString* id){
    return [RACSignal return:[RACTupleNil tupleNil]];
}

RACSignal* PostBLLObserveChange(){
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [subscriber sendNext:[PostPOD new]];
            [NSThread sleepForTimeInterval:10];
        });
        return nil;
    }];
}

//@implementation PostBLL
//
//@end

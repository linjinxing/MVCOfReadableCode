//
//  Post.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "Post.h"

@implementation PostPOD

- (NSString*) id{
    return @"111222";
}

#ifdef DEBUG
- (NSArray<NSURL*>*) imageURLs{
    return [@[
             @"http://d.ifengimg.com/mw978_mh598/p1.ifengimg.com/a/2016_53/faeb7bbf654a46a_size69_w600_h385.jpg",
             @"http://picture.youth.cn/qtdb/201612/W020161204147701357585.jpg",
             @"http://easyread.ph.126.net/vJR0Gevdu7gBZIhFn6F1Kw==/7916627756012450339.jpg",
             @"http://img.zcool.cn/community/020a695840e13ca8012060c8a43e81.jpg@800w_1l_2o_100sh.jpg"
             ] bk_map:^id _Nonnull(id  _Nonnull obj) {
                 return [NSURL URLWithString:obj];
             }];
}

- (NSArray<NSString*>*) tags{
    return @[@"标签1", @"标签2", @"标签3"];
}

- (NSArray<id<User>>*) likeUsers{
    return @[[UserPOD new], [UserPOD new], [UserPOD new], [UserPOD new], [UserPOD new]];
}


- (NSString*) desc{
    return @"描述嘿，哈，哦，嘻";
}

- (id<User>) user{
    return [UserPOD new];
}
#endif

@end






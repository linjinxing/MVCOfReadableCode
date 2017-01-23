//
//  Post.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol Post <NSObject>
@property(readonly, strong)NSString* id;
@property(readonly, strong)NSString* desc; //// 作品描述
@property(readonly, strong)id<User> author; //// 作者
@property(readonly, strong)NSArray<NSURL*>* imageURLs; //// 图片地址
@property(readonly, strong)NSArray<NSString*>* tags; ////  描述内容的标签
@property(readonly, strong)NSArray<id<User>>* likeUsers; ////  点赞用户
@end

@interface PostPOD : NSObject<Post>

@end



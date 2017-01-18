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
@property(readonly, strong)NSString* desc;
@property(readonly, strong)id<User> user;
@property(readonly, strong)NSArray<NSURL*>* imageURLs;
@property(readonly, strong)NSArray<NSString*>* tags;
@property(readonly, strong)NSArray<id<User>>* likeUsers;
@end

@interface PostPOD : NSObject<Post>

@end

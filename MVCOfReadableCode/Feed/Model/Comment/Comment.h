//
//  CommentPOD.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol Comment <NSObject>
@property(nonatomic, readonly, strong) NSString* content;
@property(nonatomic, readonly, strong) id<User> author;
@end

@interface CommentPOD : NSObject<Comment>

@end

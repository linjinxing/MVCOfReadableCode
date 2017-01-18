//
//  CommentStorage.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommentPOD.h"

@interface CommentStorage : NSObject
@property(nonatomic, readonly) NSUInteger count;
- (id<Comment>)commentForIndexPath:(NSIndexPath*)indexPath;
@end



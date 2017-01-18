//
//  CommentPOD.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Comment <NSObject>
@property(nonatomic, readonly, strong) NSString* content;
@end

@interface CommentPOD : NSObject

@end

//
//  EmojiPOD.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Emoji <NSObject>
@property(nonatomic, readonly, strong) NSString* key;
@property(nonatomic, readonly, strong) NSString* imageURL;
@end

@interface EmojiPOD : NSObject<Emoji>

@end

//
//  User.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol User <NSObject>
@property(nonatomic, readonly, strong) NSString* nickName;
@property(nonatomic, readonly, strong) NSURL* avatarURL;
@end

@interface UserPOD : NSObject<User>

@end

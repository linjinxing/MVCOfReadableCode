//
//  PostModel.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 向服务器发起请求，点赞某个帖子

 @param id <#id description#>
 @return <#return value description#>
 */
RACSignal* PostBLLLike(NSString* id);
//
//@interface PostBLL : NSObject
//
//@end

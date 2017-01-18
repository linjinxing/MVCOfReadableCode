//
//  PostModel.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 从服务器获取帖子数据

 @return <#return value description#>
 */
RACSignal* PostBLLRequest();
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

/**
  观察帖子数据的变化，比如帖子被删除，帖子点赞人数发生变化，就会将帖子从新send出来

 @return <#return value description#>
 */
RACSignal* PostBLLObserveChange();

//
//  TXFoundationDefines.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#ifndef TXFoundationDefines_h
#define TXFoundationDefines_h

typedef void(^TXSenderBlock)(id sender);
typedef void (^TXVoidBlock)();
typedef id (^TXGetDataBlock)();
typedef void(^TXDataBlock)(id data);
typedef TXDataBlock TXSuccessBlock;
typedef void(^TXFailBlock)(NSError* error);

typedef void(^TXSelectBlock)(id sender, NSIndexPath* indexPath);
typedef void(^TXSenderBlock)(id sender);
typedef TXSenderBlock TXCanelBlock;

#define DynamicProperyForView(property,tag) \
- (UIView*)property{ \
    return [self viewWithTag:tag]; \
}


#ifndef    weakify
#if __has_feature(objc_arc)

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")

#else

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __block __typeof__(x) __block_##x##__ = x; \
_Pragma("clang diagnostic pop")

#endif
#endif

#ifndef    strongify
#if __has_feature(objc_arc)

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")

#else

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __block_##x##__; \
_Pragma("clang diagnostic pop")

#endif
#endif

#define WeakSelf @weakify(self)
#define StrongSelf @strongify(self)


#endif /* TXFoundationDefines_h */

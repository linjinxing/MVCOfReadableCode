//
//  TXImageView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TXImageViewDataSource <NSObject>
- (UIImage*)iamgeView:(UIView*)imageView imageForIndexPath:(NSIndexPath*)indexPath;
- (NSInteger)imageView:(UIView*)imageView numberOfItemsInSection:(NSInteger)section;
@optional
/**
 返回有多少个section，默认返回1

 @param imageView <#imageView description#>
 @return <#return value description#>
 */
- (NSInteger)numberOfSectionsInCollectionView:(UIView*)imageView;
/**
 返回图片的标题

 @param imageView <#imageView description#>
 @param indexPath <#indexPath description#>
 @return <#return value description#>
 */
- (NSString*)iamgeView:(UIView*)imageView titleForIndexPath:(NSIndexPath*)indexPath;
/**
 返回图片的描述

 @param imageView <#imageView description#>
 @param indexPath <#indexPath description#>
 @return <#return value description#>
 */
- (NSString*)iamgeView:(UIView*)imageView descriptionForIndexPath:(NSIndexPath*)indexPath;
@end

@protocol TXImageViewDelegate <NSObject>
/**
 点击某个图片的回调

 @param imageView <#imageView description#>
 @param indexPath <#indexPath description#>
 */
- (void)imageView:(UIView*)imageView IndexPath:(NSIndexPath*)indexPath;
@end



@interface TXImageView : NSObject

@end

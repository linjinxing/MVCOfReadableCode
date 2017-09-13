//
//  PGViewActionParam.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewActionsHandler.h"

@protocol XViewActionsParam<NSObject>
//@property(readonly, assign) NSUInteger tag;         /* 标签，必须有，根据此tag查找对应的处理 */
@property(readonly, weak) __kindof UIView* sender;  /* 事件发送者, 必须有tag值，根据此tag查找对应的处理 */ 
@end


@protocol ControlActionParam<ViewActionParam>
@property(readonly, strong) id data;                /* 带的数据，发送者自定义 */
@property(readonly, assign) UIControlEvents events;
@end

@protocol CellActionParam<ViewActionParam>
@property(readonly, strong) NSIndexPath* indexPath; /* UITableView和UICollectionView要使用，或者其它 */
@end

@protocol ControlInCellActionParam<ControlActionParam, CellActionParam>
@end


@interface ViewActionParamPOD<__covariant ObjectType> : NSObject<ViewActionParam>

+ (instancetype)paramWithSender:(id)sender;

+ (instancetype)paramWithSender:(id)sender
                            tag:(NSUInteger)tag;


@end

@interface ControlActionParamPOD<__covariant ObjectType> : ViewActionParamPOD<ControlActionParam>
@property(readonly, strong) ObjectType data;

+ (instancetype)paramWithSender:(id)sender
                         Actions:(NSUInteger)Actions
                            tag:(NSUInteger)tag;
+ (instancetype)paramWithSender:(id)sender
                         Actions:(NSUInteger)Actions
                           data:(ObjectType)data
                            tag:(NSUInteger)tag;

@end

@interface CellActionParamPOD<__covariant ObjectType> : ViewActionParamPOD<CellActionParam>
+ (instancetype)paramWithSender:(id)sender
                      indexPath:(NSIndexPath*)indexPath
                            tag:(NSUInteger)tag;

@end





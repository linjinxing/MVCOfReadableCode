//
//  TXHorizontalCollectionView.h
//  PGShareKit
//
//  Created by linjinxing on 17/1/22.
//  Copyright © 2017年 linjinxing. All rights reserved.
//  水平单行,

#import <UIKit/UIKit.h>
#import "PGGridView.h"


/* 默认的宽度是numberOfItemsInSection*  */
@interface TXHorizontalCollectionView : UIView<PGHorizontalSingleLineGridView>
@property(nonatomic) UIEdgeInsets contentInset;
//@property(readonly, weak) UIButton* btn;
- (void)reloadData; 
@end



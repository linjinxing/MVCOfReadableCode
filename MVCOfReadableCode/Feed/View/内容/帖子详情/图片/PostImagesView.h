//
//  PGPostPublishImagesView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewActionsHandler.h"
#import "TXImageView.h"

@interface PostImagesView : UIView<TXImageView>
- (void)reloadData;
@end

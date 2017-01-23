//
//  PGPostPublishImagesView.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 16/12/24.
//  Copyright © 2016年 linjinxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewEventsHandler.h"
#import "TXImageView.h"

@interface PostImagesView : UIView<ViewEventsHandler, TXImageView>
- (void)reloadData;
@end

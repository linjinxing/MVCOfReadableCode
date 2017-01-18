//
//  RACSignal+MBProgressHUD.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "RACSignal+MBProgressHUD.h"

@interface RACSignal()
@property(readonly) NSMutableArray<MBProgressHUD*>* progressHUDViews;
@end

@implementation RACSignal (MBProgressHUD)

- (NSMutableArray*)progressHUDViews{
    static dispatch_once_t onceToken;
    static NSMutableArray* array = nil;
    dispatch_once(&onceToken, ^{
        array = [NSMutableArray arrayWithCapacity:30];
    });
    return array;
}

- (RACSignal*)showLoadingView{
    return [self initially:^{
        [self.progressHUDViews addObject:[MBProgressHUD showHUDAddedTo:[UIApplication topViewControllerWithController:nil].view
                                                              animated:YES]];
    }];
}

- (RACSignal*)showLoadingViewAndHideAfterCompletion{
    return [self show]
}

- (RACSignal*)hideLoadingView{
    return [self finally:^{
        [self.progressHUDViews bk_each:^(MBProgressHUD * _Nonnull obj) {
            [obj removeFromSuperview];
        }];
        [self.progressHUDViews removeAllObjects];
    }];
}

- (RACSignal*)showErrorMessage{
    
}
@end




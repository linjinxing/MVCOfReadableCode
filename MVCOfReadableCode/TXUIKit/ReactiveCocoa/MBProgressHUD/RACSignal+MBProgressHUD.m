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
    return [[self showLoadingView] hideLoadingView];
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
    return [[self deliverOnMainThread]
            doError:^(NSError *error) {
                MBProgressHUD* view = [[MBProgressHUD alloc] initWithView:[UIApplication topViewControllerWithController:nil].view];
                view.detailsLabel.text = error.localizedDescription;
                [view showAnimated:YES];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [view removeFromSuperview];
                });
    }];
}

- (RACSignal*)showLoadingViewAndErrorMessage{
    return [[[self showLoadingView] hideLoadingView] showErrorMessage];
}
@end






//
//  RACSignal+MBProgressHUD.m
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import "RACSignal+MBProgressHUD.h"

@interface RACSignal()

@end

static NSMutableArray* arrayProgressHUDViews(){
    static dispatch_once_t onceToken;
    static NSMutableArray* array = nil;
    dispatch_once(&onceToken, ^{
        array = [NSMutableArray arrayWithCapacity:30];
    });
    return array;
}

static void removeAllLoadingView(){
    [arrayProgressHUDViews() bk_each:^(MBProgressHUD * _Nonnull obj) {
        [obj hideAnimated:NO];
        [obj removeFromSuperview];
    }];
    [arrayProgressHUDViews() removeAllObjects];
}

static MBProgressHUD* showLoadingView(){
    MBProgressHUD* view = [MBProgressHUD showHUDAddedTo:[UIApplication topViewControllerWithController:nil].view
                                animated:YES];
    [arrayProgressHUDViews() addObject:view];
    return view;
}


@implementation RACSignal (MBProgressHUD)

- (RACSignal*)showLoadingView{
    return [self initially:^{
        showLoadingView();
    }];
}

- (RACSignal*)showLoadingViewAndHideAfterCompletion{
    return [[self showLoadingView] hideLoadingView];
}

- (RACSignal*)hideLoadingView{
    return [self finally:^{
        removeAllLoadingView();
    }];
}

- (RACSignal*)showErrorMessage{
    return [[self deliverOnMainThread]
            doError:^(NSError *error) {
                removeAllLoadingView();
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

+ (RACSignal*)showLoadingViewSignal{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       dispatch_async(dispatch_get_main_queue(), ^{
           [subscriber sendNext:showLoadingView()];
           [subscriber sendCompleted];
       });
        return nil;
    }];
}

@end






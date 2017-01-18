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

static MBProgressHUD* createLoadingView(NSString* title, NSString* detail){
    UIView* superView = [UIApplication topViewControllerWithController:[[[UIApplication sharedApplication] keyWindow] rootViewController]].view;
    assert(superView);
    MBProgressHUD* view = [[MBProgressHUD alloc] initWithView:superView];
    view.label.text = title;
    view.detailsLabel.text = detail;
    return view;
}

static MBProgressHUD* showLoadingView(NSString* title, NSString* detail){
    MBProgressHUD* view = createLoadingView(title, detail);
    dispatch_async(dispatch_get_main_queue(), ^{
        [view showAnimated:YES];
    });
    [arrayProgressHUDViews() addObject:view];
    return view;
}

static MBProgressHUD* showMessage(NSString* title, NSString* detail, NSTimeInterval hideAfter){
    MBProgressHUD* view = createLoadingView(title, detail);
    dispatch_async(dispatch_get_main_queue(), ^{
        [view showAnimated:YES];
        [view hideAnimated:YES afterDelay:hideAfter];
    });
    return view;
}


@implementation RACSignal (MBProgressHUD)

- (RACSignal*)showLoadingView{
    return [self showLoadingViewWithMessage:nil];
}

- (RACSignal*)showLoadingViewWithMessage:(NSString*)message{
    return [self initially:^{
        showLoadingView(message, nil);
    }];
}

- (RACSignal*)showLoadingViewAndHideAfterCompletion{
    return [[self showLoadingView]
            hideLoadingView];
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
                showMessage(nil, error.localizedDescription, 2);
    }];
}

- (RACSignal*)showSuccessWithMessage:(NSString*)message{
    return [self doCompleted:^{
        removeAllLoadingView();
        showMessage(message, nil, 2);
    }];
}

- (RACSignal*)showAllWithSuccessMessage:(NSString*)message{
    return [[[self showLoadingViewWithMessage:message]
             showSuccessWithMessage:message]
            showErrorMessage];
}

- (RACSignal*)showAllMessage{
    return [[[self showLoadingView]
             hideLoadingView]
            showErrorMessage];
}

//+ (RACSignal*)showLoadingViewSignalWithMessage:(NSString*)message{
//    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//       dispatch_async(dispatch_get_main_queue(), ^{
//           [subscriber sendNext:showLoadingView(message, nil)];
//           [subscriber sendCompleted];
//       });
//        return nil;
//    }];
//}

@end






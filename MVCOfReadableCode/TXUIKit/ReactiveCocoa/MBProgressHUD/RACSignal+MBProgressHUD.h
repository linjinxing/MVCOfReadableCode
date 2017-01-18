//
//  RACSignal+MBProgressHUD.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACSignal (MBProgressHUD)
- (RACSignal*)showLoadingView;
- (RACSignal*)showLoadingViewAndHideAfterCompletion;
- (RACSignal*)hideLoadingView;
- (RACSignal*)showErrorMessage;

- (RACSignal*)showLoadingViewAndErrorMessage;
+ (RACSignal*)showLoadingViewSignal;
@end




//
//  RACSignal+MBProgressHUD.h
//  MVCOfReadableCode
//
//  Created by linjinxing on 17/1/18.
//  Copyright © 2017年 linjinxing. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACSignal (MBProgressHUD)
/**
 显示loading

 @return <#return value description#>
 */
- (RACSignal*)showLoadingView;

/**
 显示loading，并显示message文本

 @param message 要显示的文本
 @return <#return value description#>
 */
- (RACSignal*)showLoadingViewWithMessage:(NSString*)message;

/**
 显示loading，并在compleetion或者error时，隐藏loading

 @return <#return value description#>
 */
- (RACSignal*)showLoadingViewAndHideAfterCompletion;

/**
 隐藏loading

 @return <#return value description#>
 */
- (RACSignal*)hideLoadingView;

/**
 显示错误信息，会显示error.localizedDescription

 @return <#return value description#>
 */
- (RACSignal*)showErrorMessage;

/**
 显示成功信息

 @param message 要显示的信息
 @return <#return value description#>
 */
- (RACSignal*)showSuccessWithMessage:(NSString*)message;


/**
 显示loading，completion后自动隐藏，出错时显示错误信息
 
 @return <#return value description#>
 */
- (RACSignal*)showAllMessage;

/**
 显示所有信息:
 开始时会显示loading，
 成功后，会隐藏loading，并显示message信息，
 出错时会显示出错信息

 @param message <#message description#>
 @return <#return value description#>
 */
- (RACSignal*)showAllWithSuccessMessage:(NSString*)message;

//+ (RACSignal*)showLoadingViewSignal;
@end




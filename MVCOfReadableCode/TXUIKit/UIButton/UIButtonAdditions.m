//
//  UIButton+category.m
//  BookReader
//
//  Created by mythlink on 10-11-9.
//  Copyright 2010 mythlink. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButtonAdditions.h"
#import "UIView+Layout.h"


@implementation UIButton(category)

+(id)buttonWithType:(UIButtonType)type  tag:(NSInteger)tag
{
    UIButton* btn = [[self class] buttonWithType:type];
    btn.tag = tag;
    return btn;
}

+(UIButton*)buttonWithTitle:(NSString*)title 
{
    UIButton* btn = [[self class] buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn sizeToFit];
    return btn;
}

+(UIButton*)buttonWithImageName:(NSString*)imageName
{
    return [self buttonWithImage:[UIImage imageNamed:imageName]];
}

+(id)buttonWithImageName:(NSString*)imageName tag:(NSInteger)tag
{
    UIButton* btn = [self buttonWithImageName:imageName];
    btn.tag = tag;
    return btn;
}

+(UIButton*)buttonWithImage:(UIImage*)image
{
    UIButton* btn = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
//    [btn sizeToFit];  
    return btn;
}

+(id)buttonWithImage:(UIImage*)image  tag:(NSInteger)tag
{
    UIButton* btn = [self buttonWithImage:image];
    btn.tag = tag;
    return btn;
}

+(UIButton*)buttonWithImage:(UIImage*)image nomalBgImage:(UIImage*)aNImage highlightedBgImage:(UIImage*)aHImage
{
    UIButton* btn = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:aNImage forState:UIControlStateNormal];
    [btn setBackgroundImage:aHImage forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, aNImage.size.width, aNImage.size.height);
    //    [btn sizeToFit];
    return btn;
}

+(UIButton*)buttonWithTitle:(NSString*)title tag:(NSInteger)tag
{
    UIButton* btn = [self buttonWithTitle:title];
    btn.tag = tag;
    return btn;
}

+(UIButton*)buttonWithNomalImage:(UIImage*)aNImage highlightedImage:(UIImage*)aHImage
{
    UIButton* btn = [[self class] buttonWithType:UIButtonTypeCustom];
    if (aNImage) [btn setImage:aNImage forState:UIControlStateNormal];
    if (aHImage) [btn setImage:aHImage forState:UIControlStateHighlighted];    
    [btn sizeToFit];    
    return btn;
}

+(UIButton*)buttonWithTitle:(NSString*)title normaleImage:(UIImage*)normalImage 
               highlightedImage:(UIImage*)highlightedImage;
{
    UIButton* btn = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];    
    [btn sizeToFit];
    return btn;    
}
+(UIButton*)buttonWithTitle:(NSString*)title image:(UIImage*)image
{
    return [self buttonWithTitle:title normaleImage:image highlightedImage:nil];
}

+(UIButton*)buttonWithNormalImage:(UIImage*)aNImage selectedImage:(UIImage*)aSImage
{
    UIButton *button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button setImage:aNImage forState:UIControlStateNormal];
    [button setImage:aSImage forState:UIControlStateSelected];
    [button sizeToFit];
    
    return button;
}

+(UIButton*)button4NaviBarWithTitle:(NSString*)aTitle origin:(CGPoint)aPoint
{
    UIButton* btn = [self buttonWithTitle:aTitle];
    [btn sizeToFit];
    CGRect frame = btn.frame;
    frame.origin = aPoint;
    btn.frame = frame;
    //    btn.frame = CGRectMake(aPoint.x, aPoint.y, , );
    return btn;
}

- (void)centerImageAndTitle:(float)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // get the height they will take up as a unit
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0);
}

- (void)centerImageAndTitle
{
    const int DEFAULT_SPACING = 6.0f;
    [self centerImageAndTitle:DEFAULT_SPACING];
}


- (void)verticalCenterImageAndTitle:(CGFloat)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing/2), 0.0);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing/2), 0.0, 0.0, - titleSize.width);
}

- (void)verticalCenterImageAndTitle
{
    const int DEFAULT_SPACING = 6.0f;
    [self verticalCenterImageAndTitle:DEFAULT_SPACING];
}


- (void)horizontalCenterTitleAndImage:(CGFloat)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width + spacing/2);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing/2, 0.0, - titleSize.width);
}

- (void)horizontalCenterTitleAndImage
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImage:DEFAULT_SPACING];
}


- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;
{
    // get the size of the elements here for readability
    //    CGSize imageSize = self.imageView.frame.size;
    //    CGSize titleSize = self.titleLabel.frame.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0,  0.0, 0.0,  - spacing/2);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing/2, 0.0, 0.0);
}

- (void)horizontalCenterImageAndTitle;
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterImageAndTitle:DEFAULT_SPACING];
}


- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing
{
    // get the size of the elements here for readability
    //    CGSize imageSize = self.imageView.frame.size;
    //    CGSize titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing, 0.0, 0.0);
}

- (void)horizontalCenterTitleAndImageLeft
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImageLeft:DEFAULT_SPACING];
}


- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, 0.0);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + imageSize.width + spacing, 0.0, - titleSize.width);
}

- (void)horizontalCenterTitleAndImageRight
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImageRight:DEFAULT_SPACING];
}

@end


static char overviewKey;


@implementation UIButton(Block)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(TXSenderBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

- (void)callActionBlock:(id)sender {
    TXSenderBlock block = (TXSenderBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block(self);
    }
}

- (void) addTouchUpInsideActionWithBlock:(TXSenderBlock)action{
    [self handleControlEvent:UIControlEventTouchUpInside withBlock:action];
}

@end


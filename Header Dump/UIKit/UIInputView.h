//
//  UIInputView.h
//  UIKit
//
//  Copyright (c) 2012-2013, Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIInputViewStyle) {
    UIInputViewStyleDefault,
    UIInputViewStyleKeyboard,       // mimics the keyboard background
} NS_ENUM_AVAILABLE_IOS(7_0);

NS_CLASS_AVAILABLE_IOS(7_0) @interface UIInputView : UIView

@property (nonatomic, readonly) UIInputViewStyle inputViewStyle;

- (id)initWithFrame:(CGRect)frame inputViewStyle:(UIInputViewStyle)inputViewStyle;  // designated initializer

@end

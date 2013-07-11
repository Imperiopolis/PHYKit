/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIStatusBarStyleAttributes.h>

@class UIColor;

__attribute__((visibility("hidden")))
@interface UIStatusBarNewUIStyleAttributes : UIStatusBarStyleAttributes
{
    UIColor *_backgroundColor;
    UIColor *_foregroundColor;
}

- (id)newForegroundStyleWithHeight:(float)arg1;
- (Class)foregroundStyleClass;
- (id)backgroundColorWithTintColor:(id)arg1;
- (BOOL)shouldUseVisualAltitude;
- (BOOL)isTransparent;
- (BOOL)isTranslucent;
- (int)legibilityStyle;
- (void)dealloc;
- (id)initWithRequest:(id)arg1;
- (id)initWithRequest:(id)arg1 backgroundColor:(id)arg2 foregroundColor:(id)arg3;

@end


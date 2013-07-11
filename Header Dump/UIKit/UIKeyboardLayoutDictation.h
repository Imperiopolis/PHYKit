/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIKeyboardLayout.h>

@class UIKBBackgroundView, UIKBTree;

__attribute__((visibility("hidden")))
@interface UIKeyboardLayoutDictation : UIKeyboardLayout
{
    UIKBBackgroundView *_backgroundView;
    UIKBTree *_keyplane;
}

+ (float)landscapeHeight;
+ (float)portraitHeight;
+ (id)activeInstance;
- (BOOL)usesAutoShift;
- (id)currentKeyplane;
- (struct CGSize)splitLeftSize;
- (BOOL)shouldFadeToLayout;
- (BOOL)shouldFadeFromLayout;
- (void)layoutSubviews;
- (void)setRenderConfig:(id)arg1;
- (void)showKeyboardWithInputTraits:(id)arg1 screenTraits:(id)arg2 splitTraits:(id)arg3;
- (void)setupBackgroundViewForNewSplitTraits:(id)arg1;
- (int)_clipCornersOfView:(id)arg1;
- (BOOL)visible;
- (id)initWithFrame:(struct CGRect)arg1;

@end


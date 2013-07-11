/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIDictationView.h>

UIGestureRecognizerDelegate.h
@class UIDimmingView;

__attribute__((visibility("hidden")))
@interface UIDictationFloatingStarkView : UIDictationView <UIGestureRecognizerDelegate>
{
    UIDimmingView *_dimmingView;
}

- (void)endpointButtonPressed;
- (void)show;
- (struct CGPoint)positionForShow;
- (void)returnToKeyboard;
- (void)dimmingViewWasTapped:(id)arg1;
- (void)setInputViewsHiddenForDictation:(BOOL)arg1;
- (void)setState:(int)arg1;
- (void)prepareForReturnToKeyboard;
- (void)finishReturnToKeyboard;
- (void)layoutSubviews;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1;

@end


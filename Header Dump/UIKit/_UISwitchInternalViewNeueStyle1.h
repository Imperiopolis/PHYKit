/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIView.h>

_UISwitchInternalViewProtocol.h
@class UIColor, UIImage, UIImageView;

__attribute__((visibility("hidden")))
@interface _UISwitchInternalViewNeueStyle1 : UIView <_UISwitchInternalViewProtocol>
{
    UIView *_switchWellView;
    UIView *_leftSwitchWellView;
    UIView *_switchWellContainerView;
    UIView *_leftSwitchWellContainerView;
    UIImageView *_knobView;
    UIColor *_onTintColor;
    UIColor *_tintColor;
    BOOL _on;
    BOOL _pressed;
    BOOL _useAlternateColor;
    BOOL _pressedIsHandledByGestureRecognizer;
    UIColor *_thumbTintColor;
    UIImage *_onImage;
    UIImage *_offImage;
}

@property(nonatomic) BOOL pressedIsHandledByGestureRecognizer; // @synthesize pressedIsHandledByGestureRecognizer=_pressedIsHandledByGestureRecognizer;
@property(retain, nonatomic) UIImage *offImage; // @synthesize offImage=_offImage;
@property(retain, nonatomic) UIImage *onImage; // @synthesize onImage=_onImage;
@property(nonatomic) BOOL useAlternateColor; // @synthesize useAlternateColor=_useAlternateColor;
@property(nonatomic) BOOL on; // @synthesize on=_on;
@property(retain, nonatomic) UIColor *thumbTintColor; // @synthesize thumbTintColor=_thumbTintColor;
@property(retain, nonatomic) UIColor *tintColor; // @synthesize tintColor=_tintColor;
@property(retain, nonatomic) UIColor *onTintColor; // @synthesize onTintColor=_onTintColor;
- (void)_setPressed:(BOOL)arg1 on:(BOOL)arg2 animated:(BOOL)arg3 shouldAnimateLabels:(BOOL)arg4 completion:(id)arg5;
- (void)_prepareForInteraction;
- (void)_cleanUpAfterAnimating;
- (void)setSendAction:(BOOL)arg1;
- (void)_setPressed:(BOOL)arg1;
- (void)_setPressed:(BOOL)arg1 animated:(BOOL)arg2;
- (void)_setOn:(BOOL)arg1 animated:(BOOL)arg2 force:(BOOL)arg3;
- (void)_setProgress:(float)arg1;
- (void)_setProgress:(float)arg1 animated:(BOOL)arg2 withDuration:(float)arg3 force:(BOOL)arg4 sendAction:(BOOL)arg5;
- (id)_effectiveThumbImage;
- (id)_effectiveOffTextColor;
- (id)_effectiveTintColor;
- (id)_effectiveOnTintColor;
- (id)_labelOpacityAnimation;
- (id)_switchSpringAnimationWithKeyPath:(id)arg1 fromValue:(id)arg2 toValue:(id)arg3 pressed:(BOOL)arg4;
- (id)_switchTrackColorAnimationWithFromValue:(id)arg1 toValue:(id)arg2;
- (id)_switchTrackAnimationWithFromValue:(id)arg1 toValue:(id)arg2 on:(BOOL)arg3;
- (struct CGColor *)_wellColorOn:(BOOL)arg1;
- (float)_wellBorderWidthPressed:(BOOL)arg1 on:(BOOL)arg2;
- (struct CGPoint)_leftSwitchWellContainerPositionOn:(BOOL)arg1 pressed:(BOOL)arg2;
- (struct CGRect)_leftSwitchWellContainerBoundsOn:(BOOL)arg1 pressed:(BOOL)arg2;
- (struct CGPoint)_switchWellPositionOn:(BOOL)arg1 pressed:(BOOL)arg2;
- (struct CGPoint)_switchWellContainerPositionOn:(BOOL)arg1 pressed:(BOOL)arg2;
- (struct CGRect)_switchWellContainerBoundsOn:(BOOL)arg1 pressed:(BOOL)arg2;
- (struct CGPoint)_knobPositionOn:(BOOL)arg1 pressed:(BOOL)arg2 forBounds:(struct CGRect)arg3;
- (struct CGRect)_knobBoundsPressed:(BOOL)arg1;
- (void)_transitionWellViewToOn:(BOOL)arg1 animated:(BOOL)arg2;
- (void)_transitionWellViewToPressed:(BOOL)arg1 animated:(BOOL)arg2;
- (void)_transitionKnobToOn:(BOOL)arg1 animated:(BOOL)arg2;
- (void)_transitionKnobToPressed:(BOOL)arg1 animated:(BOOL)arg2;
- (void)_transitionKnobToPressed:(BOOL)arg1 on:(BOOL)arg2 animated:(BOOL)arg3;
- (struct CGRect)_frameForLeftAlignmentOfView:(id)arg1;
- (void)_invalidateKnob;
- (void)_invalidateWell;
- (void)_invalidateControl;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1;

@end


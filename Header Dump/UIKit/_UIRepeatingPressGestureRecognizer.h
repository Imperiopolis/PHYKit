/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIGestureRecognizer.h>

@interface _UIRepeatingPressGestureRecognizer : UIGestureRecognizer
{
    BOOL _timerOn;
    int _delayIndex;
    unsigned int _numberOfTouchesRequired;
    int _buttonType;
}

+ (double)delayForRepeatNumber:(int)arg1;
@property(nonatomic, setter=_setButtonType:) int _buttonType; // @synthesize _buttonType;
@property(nonatomic) unsigned int numberOfTouchesRequired; // @synthesize numberOfTouchesRequired=_numberOfTouchesRequired;
- (void)_nextStep:(id)arg1;
- (void)_scheduleNextTimer;
- (void)_clearTapTimer;
- (void)_cancelPress;
- (void)_endPress;
- (void)_beginPress;
- (void)_physicalButtonsCancelled:(id)arg1 withEvent:(id)arg2;
- (void)_physicalButtonsEnded:(id)arg1 withEvent:(id)arg2;
- (void)_physicalButtonsBegan:(id)arg1 withEvent:(id)arg2;
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)_resetGestureRecognizer;
- (void)setView:(id)arg1;
- (void)dealloc;

@end


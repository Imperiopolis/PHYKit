/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
__attribute__((visibility("hidden")))
@interface UITouchTapInfo : NSObject
{
    unsigned int _tapCount;
    float _multiTapDelay;
    float _rejectAsTapThrehold;
    float _viewTouchPauseThreshold;
    struct CGPoint _startPosition;
    double _startTime;
}

- (BOOL)cancelTouchTracking;
- (void)touchEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchMoved:(id)arg1 withEvent:(id)arg2;
- (BOOL)_touchLocationConsideredMovement:(id)arg1;
- (void)touchBegan:(id)arg1 withEvent:(id)arg2;
- (void)clearTapState;
- (void)releaseAndClearWeakRefs;

@end


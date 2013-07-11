/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/_UISettings.h>

@interface _UIMotionAnalyzerSettings : _UISettings
{
    BOOL _showIdleIndicator;
    BOOL _jumpEnabled;
    BOOL _playJumpSound;
    BOOL _directionalLockEnabled;
    BOOL _showDirectionalLockIndicators;
    BOOL _referenceShiftEnabled;
    float _inputSmoothingFactor;
    float _referenceShiftSpeed;
    float _idleLeeway;
    float _delayBeforeIdle;
    float _jumpThreshold;
    float _directionalLockThreshold;
    float _directionalLockStickiness;
    float _directionalLockSharpness;
    float _referenceShiftDistanceDependence;
}

@property float referenceShiftDistanceDependence; // @synthesize referenceShiftDistanceDependence=_referenceShiftDistanceDependence;
@property BOOL referenceShiftEnabled; // @synthesize referenceShiftEnabled=_referenceShiftEnabled;
@property BOOL showDirectionalLockIndicators; // @synthesize showDirectionalLockIndicators=_showDirectionalLockIndicators;
@property float directionalLockSharpness; // @synthesize directionalLockSharpness=_directionalLockSharpness;
@property float directionalLockStickiness; // @synthesize directionalLockStickiness=_directionalLockStickiness;
@property float directionalLockThreshold; // @synthesize directionalLockThreshold=_directionalLockThreshold;
@property BOOL directionalLockEnabled; // @synthesize directionalLockEnabled=_directionalLockEnabled;
@property BOOL playJumpSound; // @synthesize playJumpSound=_playJumpSound;
@property float jumpThreshold; // @synthesize jumpThreshold=_jumpThreshold;
@property BOOL jumpEnabled; // @synthesize jumpEnabled=_jumpEnabled;
@property BOOL showIdleIndicator; // @synthesize showIdleIndicator=_showIdleIndicator;
@property float delayBeforeIdle; // @synthesize delayBeforeIdle=_delayBeforeIdle;
@property float idleLeeway; // @synthesize idleLeeway=_idleLeeway;
@property float referenceShiftSpeed; // @synthesize referenceShiftSpeed=_referenceShiftSpeed;
@property float inputSmoothingFactor; // @synthesize inputSmoothingFactor=_inputSmoothingFactor;
- (unsigned int)hash;
- (BOOL)isEqual:(id)arg1;
- (void)setDefaultValues;

@end


/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@class UIColor;

@interface _UILegibilitySettingsProvider : NSObject
{
    BOOL _accumulatorIsPrimed;
    float _mostRecentSaturation;
    float _accumulatedSaturation;
    float _mostRecentBrightness;
    float _accumulatedBrightness;
    UIColor *_contentColor;
    int _currentStyle;
    double _nextChangeBarrier;
}

+ (int)styleForContentColor:(id)arg1;
@property(nonatomic) int currentStyle; // @synthesize currentStyle=_currentStyle;
@property(nonatomic) double nextChangeBarrier; // @synthesize nextChangeBarrier=_nextChangeBarrier;
@property(nonatomic) BOOL accumulatorIsPrimed; // @synthesize accumulatorIsPrimed=_accumulatorIsPrimed;
@property(retain, nonatomic) UIColor *contentColor; // @synthesize contentColor=_contentColor;
@property(nonatomic) float accumulatedBrightness; // @synthesize accumulatedBrightness=_accumulatedBrightness;
@property(nonatomic) float mostRecentBrightness; // @synthesize mostRecentBrightness=_mostRecentBrightness;
@property(nonatomic) float accumulatedSaturation; // @synthesize accumulatedSaturation=_accumulatedSaturation;
@property(nonatomic) float mostRecentSaturation; // @synthesize mostRecentSaturation=_mostRecentSaturation;
- (id)settings;
- (void)clearContentColorAccumulator;
- (BOOL)accumulateChangesToContentColor:(id)arg1;

@end


/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
__attribute__((visibility("hidden")))
@interface _UIMotionEffectEngineLogger : NSObject
{
    int _motionLevelSamples[8];
    int _sampleCount;
    int _updateFreqency;
    double _lastUpdateTimeStamp;
}

- (void)_dumpToAggregated;
- (double)lastRecordedTimestamp;
- (void)recordMotionMagnitude:(float)arg1 atTimestamp:(double)arg2;
- (id)initWithFastUpdateInterval:(double)arg1 slowUpdateInterval:(double)arg2;

@end


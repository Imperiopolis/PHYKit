/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@interface UIStatusBarAnimationParameters : NSObject
{
    double _duration;
    double _delay;
    int _curve;
    id <_UIBasicAnimationFactory> _animationFactory;
    double _startTime;
}

+ (void)animateWithParameters:(id)arg1 fromCurrentState:(BOOL)arg2 frameInterval:(float)arg3 animations:(id)arg4 completion:(void)arg5;
+ (void)animateWithParameters:(id)arg1 fromCurrentState:(BOOL)arg2 animations:(id)arg3 completion:(void)arg4;
+ (void)animateWithParameters:(id)arg1 animations:(id)arg2 completion:(void)arg3;
@property(nonatomic) double startTime; // @synthesize startTime=_startTime;
@property(retain, nonatomic) id <_UIBasicAnimationFactory> animationFactory; // @synthesize animationFactory=_animationFactory;
@property(nonatomic) int curve; // @synthesize curve=_curve;
@property(nonatomic) double duration; // @synthesize duration=_duration;
@property(nonatomic) double delay; // @synthesize delay=_delay;
- (BOOL)shouldAnimate;
- (id)initWithEmptyParameters;
- (id)initWithDefaultParameters;
- (void)dealloc;
- (id)init;

@end


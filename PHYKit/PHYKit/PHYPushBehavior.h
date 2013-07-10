//
//  PHYPushBehavior.h
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "PHYDynamicBehavior.h"

typedef NS_ENUM(NSInteger, PHYPushBehaviorMode) {
    UIPushBehaviorModeContinuous,
    UIPushBehaviorModeInstantaneous
};

@interface PHYPushBehavior : PHYDynamicBehavior

@property (nonatomic, readonly, copy) NSArray* items;

@property (nonatomic, readonly) PHYPushBehaviorMode mode;
@property (nonatomic, readwrite) BOOL active;

@property (readwrite, nonatomic) CGFloat angle;
// A continuous force vector with a magnitude of 1.0, applied to a 100 point x 100 point view whose density value is 1.0, results in view acceleration of 100 points per s^2
@property (readwrite, nonatomic) CGFloat magnitude;

@property (readwrite, nonatomic) CGFloat xComponent;
@property (readwrite, nonatomic) CGFloat yComponent;

- (instancetype)initWithItems:(NSArray *)items mode:(PHYPushBehaviorMode)mode;

- (void)addItem:(id <PHYDynamicItem>)item;
- (void)removeItem:(id <PHYDynamicItem>)item;

- (CGPoint)targetPointForItem:(id <PHYDynamicItem>)item;
- (void)setTargetPoint:(CGPoint)p forItem:(id <PHYDynamicItem>)item;

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude;
- (void)setXComponent:(CGFloat)x yComponent:(CGFloat)y;

@end
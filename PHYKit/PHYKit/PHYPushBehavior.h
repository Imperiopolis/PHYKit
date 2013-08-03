//
//  PHYPushBehavior.h
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYDynamicBehavior.h"

typedef NS_ENUM(NSInteger, PHYPushBehaviorMode) {
    PHYPushBehaviorModeContinuous,
    PHYPushBehaviorModeInstantaneous
};

@interface PHYPushBehavior : PHYDynamicBehavior

@property (nonatomic, readonly) PHYPushBehaviorMode mode;
@property (nonatomic, readwrite) BOOL active;

@property (readwrite, nonatomic) CGFloat angle;
// A continuous force vector with a magnitude of 1.0, applied to a 100 point x 100 point view whose density value is 1.0, results in view acceleration of 100 points per s^2
@property (readwrite, nonatomic) CGFloat magnitude;
@property (readwrite, nonatomic) CGSize pushDirection;


- (instancetype)initWithItems:(NSArray *)items mode:(PHYPushBehaviorMode)mode;

- (void)addItem:(id <PHYDynamicItem>)item;
- (void)removeItem:(id <PHYDynamicItem>)item;

- (PHYOffset)targetOffsetFromCenterForItem:(id <PHYDynamicItem>)item;
- (void)setTargetOffsetFromCenter:(PHYOffset)o forItem:(id <PHYDynamicItem>)item;

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude;

@end

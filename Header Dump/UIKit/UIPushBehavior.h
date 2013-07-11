//
//  UIPushBehavior.h
//  UIKit
//
//  Copyright (c) 2012-2013, Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <UIKit/UIDynamicBehavior.h>

typedef NS_ENUM(NSInteger, UIPushBehaviorMode) {
    UIPushBehaviorModeContinuous,
    UIPushBehaviorModeInstantaneous
} NS_ENUM_AVAILABLE_IOS(7_0);

NS_CLASS_AVAILABLE_IOS(7_0) @interface UIPushBehavior : UIDynamicBehavior

- (instancetype)initWithItems:(NSArray *)items mode:(UIPushBehaviorMode)mode;

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;
@property (nonatomic, readonly, copy) NSArray* items;

- (CGPoint)targetPointForItem:(id <UIDynamicItem>)item;
- (void)setTargetPoint:(CGPoint)p forItem:(id <UIDynamicItem>)item;

@property (nonatomic, readonly) UIPushBehaviorMode mode;
@property (nonatomic, readwrite) BOOL active;

@property (readwrite, nonatomic) CGFloat angle;
// A continuous force vector with a magnitude of 1.0, applied to a 100 point x 100 point view whose density value is 1.0, results in view acceleration of 100 points per s^2
@property (readwrite, nonatomic) CGFloat magnitude;

@property (readwrite, nonatomic) CGFloat xComponent;
@property (readwrite, nonatomic) CGFloat yComponent;

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude;
- (void)setXComponent:(CGFloat)x yComponent:(CGFloat)y;

@end
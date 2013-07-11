//
//  UIGravityBehavior.h
//  UIKit
//
//  Copyright (c) 2012-2013, Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <UIKit/UIDynamicBehavior.h>

NS_CLASS_AVAILABLE_IOS(7_0) @interface UIGravityBehavior : UIDynamicBehavior

- (instancetype)initWithItems:(NSArray *)items;

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;
@property (nonatomic, readonly, copy) NSArray* items;

// The default value for the gravity vector is (0.0, 1.0)
// The acceleration for a dynamic item subject to a (0.0, 1.0) gravity vector is downwards at 1000 points per second².
@property (readwrite, nonatomic) CGFloat xComponent;
@property (readwrite, nonatomic) CGFloat yComponent;
- (void)setXComponent:(CGFloat)x yComponent:(CGFloat)y;

@end

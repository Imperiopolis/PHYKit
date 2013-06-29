//
//  PHYDynamicGravityBehavior.h
//  PHYKit
//
//  Created by Nora Trapp on 6/28/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYDynamicBehavior.h"

@interface PHYGravityBehavior : PHYDynamicBehavior

- (instancetype)initWithItems:(NSArray *)items;

- (void)addItem:(id <PHYDynamicItem>)item;
- (void)removeItem:(id <PHYDynamicItem>)item;
- (void)setXComponent:(CGFloat)x yComponent:(CGFloat)y;

@property (nonatomic, readonly, copy) NSArray* items;

// The default value for the gravity vector is (0.0, 1.0)
// The acceleration for a dynamic item subject to a (0.0, 1.0) gravity vector is downwards at 1000 points per second².
@property (readwrite, nonatomic) CGFloat xComponent;
@property (readwrite, nonatomic) CGFloat yComponent;

@end

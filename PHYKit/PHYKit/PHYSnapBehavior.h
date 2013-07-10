//
//  PHYSnapBehavior.h
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYDynamicBehavior.h"

@interface PHYSnapBehavior : PHYDynamicBehavior

@property (nonatomic, assign) CGFloat damping; // damping value from 0.0 to 1.0. 0.0 is the least oscillation.

// The point argument is expressed in the reference coordinate system
- (instancetype)initWithItem:(id <PHYDynamicItem>)item snapToPoint:(CGPoint)point;

@end

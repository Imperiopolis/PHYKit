//
//  PHYPushBehavior.m
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYPushBehavior.h"

@implementation PHYPushBehavior

- (instancetype)initWithItems:(NSArray *)items mode:(PHYPushBehaviorMode)mode
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)addItem:(id <PHYDynamicItem>)item
{
    
}

- (void)removeItem:(id <PHYDynamicItem>)item
{
    
}


- (CGPoint)targetPointForItem:(id <PHYDynamicItem>)item
{
    return CGPointZero;
}

- (void)setTargetPoint:(CGPoint)p forItem:(id <PHYDynamicItem>)item
{
    
}


- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude
{
    
}

- (void)setXComponent:(CGFloat)x yComponent:(CGFloat)y
{
    
}


@end

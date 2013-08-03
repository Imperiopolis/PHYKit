//
//  PHYPushBehavior.m
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYPushBehavior.h"

@interface PHYPushBehavior ()
{
    NSMutableSet *_items;
}

@end

@implementation PHYPushBehavior

- (instancetype)initWithItems:(NSArray *)items mode:(PHYPushBehaviorMode)mode
{
    self = [super init];
    if (self)
    {
        _items = [NSMutableSet setWithArray: items];
        _mode = mode;
    }
    return self;
}

- (NSArray*)items
{
    return [_items allObjects];
}

- (void)addItem:(id <PHYDynamicItem>)item
{
    NSIndexSet *idx = [NSIndexSet indexSetWithIndex:[_items count]];
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:idx forKey:@"items"];
    [_items addObject:item];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:idx forKey:@"items"];
}

- (void)removeItem:(id <PHYDynamicItem>)item
{
    NSIndexSet *idx = [NSIndexSet indexSetWithIndex:[[_items allObjects] indexOfObject:item]];
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:idx forKey:@"items"];
    [_items removeObject:item];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:idx forKey:@"items"];
}

- (PHYOffset)targetOffsetFromCenterForItem:(id <PHYDynamicItem>)item
{
    return PHYOffsetMake(0, 0);
}

- (void)setTargetOffsetFromCenter:(PHYOffset)o forItem:(id <PHYDynamicItem>)item
{
    
}

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude
{
    self.angle = angle;
    self.magnitude = magnitude;
}

- (void)setPushDirection:(CGSize)pushDirection
{
    _pushDirection = pushDirection;
    _magnitude = fabsf(sqrtf(powf(pushDirection.height, 2) + powf(pushDirection.width, 2)));
    _angle = pushDirection.width ? atanf(pushDirection.height / pushDirection.width) : 0;
}

- (void)setAngle:(CGFloat)angle
{
    _angle = angle; // convert from radians
    _pushDirection = CGSizeMake(cos(_angle) * _magnitude, sin(_angle) * _magnitude);
}

- (void)setMagnitude:(CGFloat)magnitude
{
    _magnitude = magnitude;
    _pushDirection = CGSizeMake(cos(_angle) * _magnitude, sin(_angle) * _magnitude);
}


@end

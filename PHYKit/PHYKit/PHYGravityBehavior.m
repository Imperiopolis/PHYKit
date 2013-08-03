//
//  PHYDynamicGravityBehavior.m
//  PHYKit
//
//  Created by Nora Trapp on 6/28/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYGravityBehavior.h"
#import <math.h>

@interface PHYGravityBehavior ()
{
    CGFloat _angle;
    NSMutableSet *_items;
}

@end

@implementation PHYGravityBehavior

- (instancetype)initWithItems:(NSArray *)items
{
    if ((self = [super init]))
    {
        _items = [NSMutableSet setWithArray: items];
        self.magnitude = 1;
        self.angle = M_PI_2;
    }
    
    return self;
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

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude
{
    self.angle = angle;
    self.magnitude = magnitude;
}

- (void)setGravityDirection:(CGSize)gravityDirection
{
    _gravityDirection = gravityDirection;
    _magnitude = fabsf(sqrtf(powf(_gravityDirection.height, 2) + powf(_gravityDirection.width, 2)));
    _angle = gravityDirection.width ? atanf(gravityDirection.height / gravityDirection.width) : 0;
}

- (void)setAngle:(CGFloat)angle
{
    _angle = angle; // convert from radians
    _gravityDirection = CGSizeMake(cos(_angle) * _magnitude, sin(_angle) * _magnitude);
}

- (void)setMagnitude:(CGFloat)magnitude
{
    _magnitude = magnitude;
    _gravityDirection = CGSizeMake(cos(_angle) * _magnitude, sin(_angle) * _magnitude);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; gravity = <%f, %f>>", [self className], self, self.angle, self.magnitude];
}

- (NSArray*)items
{
    return [_items allObjects];
}

@end

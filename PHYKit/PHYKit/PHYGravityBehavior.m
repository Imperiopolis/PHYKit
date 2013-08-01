//
//  PHYDynamicGravityBehavior.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/28/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "PHYGravityBehavior.h"
#import <math.h>

@interface PHYGravityBehavior ()
{
    NSMutableArray *_items;
    CGFloat _angle;
}

@end

@implementation PHYGravityBehavior

- (instancetype)initWithItems:(NSArray *)items
{
    if ((self = [super init]))
    {
        _items = [NSMutableArray arrayWithArray:items];
        self.magnitude = 1;
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
    NSIndexSet *idx = [NSIndexSet indexSetWithIndex:[_items indexOfObject:item]];
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
    _angle = angle * (180 / M_PI); // convert from radians
    _gravityDirection = CGSizeMake(sin(_angle) * _magnitude, cos(_angle) * _magnitude);
}

- (CGFloat)angle
{
    return _angle * (M_PI / 180); // convert to radians
}

- (void)setMagnitude:(CGFloat)magnitude
{
    _magnitude = magnitude;
    _gravityDirection = CGSizeMake(sin(_angle) * _magnitude, cos(_angle) * _magnitude);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; gravity = <%f, %f>>", [self className], self, self.angle, self.magnitude];
}

@end

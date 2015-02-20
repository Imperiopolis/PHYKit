//
//  PHYDynamicGravityBehavior.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/28/13.
//  Copyright (c) 2013 Nathan Trapp and Zev Eisenberg. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PHYGravityBehavior.h"
#import "PHYDynamicAnimator.h"
#import "PHYBody.h"
#import "PHYWorld.h"

#import <math.h>

#define kGravityScaleFactor    (1000)

@interface PHYDynamicAnimator (PHYPrivateAnimator)

- (PHYBody*)bodyFromDynamicItem:(id <PHYDynamicItem>)dynamicItem;
@property (nonatomic, strong) PHYWorld *world;

@end

@interface PHYGravityBehavior ()
{
    CGFloat _angle;
    NSMutableSet *_items;
    void (^_action)(void);
}

@property (nonatomic, copy) void (^internalAction)(void);

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
    _angle = angle;
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

- (void (^)(void))action
{
    __weak __typeof(_internalAction) internalAction = _internalAction;
    __weak __typeof(_action) action = _action;

    return ^{
        if (internalAction) internalAction();
        if (action) action();
    };
}

- (void)willMoveToAnimator:(PHYDynamicAnimator *)animator
{
    [super willMoveToAnimator: animator];

    if (animator)
    {
        __weak __typeof(self) weakSelf = self;

        self.internalAction = ^{
            animator.world.gravity = CGPointMake(weakSelf.gravityDirection.width * kGravityScaleFactor, weakSelf.gravityDirection.height * kGravityScaleFactor);

            for (id<PHYDynamicItem> dynamicItem in weakSelf.items)
            {
                PHYBody *body = [animator bodyFromDynamicItem:dynamicItem];

                if (body && !body.affectedByGravity)
                {
                    body.affectedByGravity = YES;
                }
            }
        };
    }
}

@end

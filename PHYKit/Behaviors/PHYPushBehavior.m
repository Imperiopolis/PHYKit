//
//  PHYPushBehavior.m
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
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

#import "PHYPushBehavior.h"
#import "PHYDynamicAnimator.h"
#import "PHYBody.h"

@interface PHYDynamicAnimator (PHYPrivateAnimator)

- (PHYBody*)bodyFromDynamicItem:(id <PHYDynamicItem>)dynamicItem;

@end

@interface PHYPushBehavior ()
{
    NSMutableSet *_items;
    void (^_action)(void);
}

@property (weak) PHYBody *body;
@property (nonatomic, copy) void (^internalAction)(void);

@end

@implementation PHYPushBehavior

- (instancetype)initWithItems:(NSArray *)items mode:(PHYPushBehaviorMode)mode
{
    self = [super init];
    if (self)
    {
        _items = [NSMutableSet setWithArray: items];
        _mode = mode;

        switch (self.mode) {
            case PHYPushBehaviorModeInstantaneous:
                self.active = NO;
                break;
            case PHYPushBehaviorModeContinuous:
                self.active = YES;
        }
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
    _angle = angle;
    _pushDirection = CGSizeMake(cos(_angle) * _magnitude, sin(_angle) * _magnitude);
}

- (void)setMagnitude:(CGFloat)magnitude
{
    _magnitude = magnitude;
    _pushDirection = CGSizeMake(cos(_angle) * _magnitude, sin(_angle) * _magnitude);
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

- (void)willMoveToAnimator:(PHYDynamicAnimator *__weak)animator
{
    [super willMoveToAnimator: animator];

    if (animator)
    {
        __weak __typeof(self) weakSelf = self;

        self.internalAction = ^{
            if (weakSelf.active)
            {
                for (id<PHYDynamicItem> dynamicItem in weakSelf.items)
                {
                    PHYBody *body = [animator bodyFromDynamicItem:dynamicItem];

                    if (body)
                    {
                        [body applyUnscaledImpulse: CGPointMake(weakSelf.pushDirection.width * 5, weakSelf.pushDirection.height * 5)];

                        if (weakSelf.mode == PHYPushBehaviorModeInstantaneous)
                        {
                            weakSelf.active = NO;
                        }
                    }
                }
            }
        };
    }
}

@end

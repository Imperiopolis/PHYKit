//
//  PHYPushBehavior.m
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

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
    __weak typeof(_internalAction) internalAction = _internalAction;
    __weak typeof(_action) action = _action;

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
        __weak typeof(self) weakSelf = self;

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

//
//  PHYDynamicCollisionBehavior.m
//  PHYKit
//
//  Created by Nora Trapp on 6/29/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYCollisionBehavior.h"
#import "PHYDynamicAnimator.h"
#import "PHYBody.h"
#import "PHYWorld.h"

@interface PHYDynamicAnimator (PHYPrivateAnimator)

- (PHYBody*)bodyFromDynamicItem:(id <PHYDynamicItem>)dynamicItem;

@end

@interface PHYCollisionBehavior ()
{
    NSMutableSet *_items;
    void (^_action)(void);
}

@property (nonatomic, copy) void (^internalAction)(void);

@end

@implementation PHYCollisionBehavior

- (instancetype)initWithItems:(NSArray *)items
{
    if ((self = [super init]))
    {
        _items = [NSMutableSet setWithArray:items];
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


- (void)setTranslatesReferenceBoundsIntoBoundaryWithInsets:(NSEdgeInsets)insets
{
    
}

- (void)addBoundaryWithIdentifier:(id <NSCopying>)identifier forPath:(NSBezierPath*)bezierPath
{
    
}

- (void)addBoundaryWithIdentifier:(id <NSCopying>)identifier fromPoint:(CGPoint)p1 toPoint:(CGPoint)p2
{
    
}

- (NSBezierPath*)boundaryWithIdentifier:(id <NSCopying>)identifier
{
    return nil;
}

- (void)removeBoundaryWithIdentifier:(id <NSCopying>)identifier
{
    
}

- (void)removeAllBoundaries
{
    
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
            for (id<PHYDynamicItem> dynamicItem in weakSelf.items)
            {
                PHYBody *body = [animator bodyFromDynamicItem:dynamicItem];

                if (weakSelf.translatesReferenceBoundsIntoBoundary)
                {
                    body.collisionBitMask = PHYReferenceCollisions;
                }

                switch (weakSelf.collisionMode) {
                    case PHYCollisionBehaviorModeEverything:
                        body.collisionBitMask = PHYReferenceCollisions | PHYBoundaryCollisions | PHYCollisionBehaviorModeItems;
                    case PHYCollisionBehaviorModeBoundaries:
                        body.collisionBitMask = body.collisionBitMask | PHYBoundaryCollisions;
                        break;
                    case PHYCollisionBehaviorModeItems:
                        body.collisionBitMask = body.collisionBitMask | PHYCollisionBehaviorModeItems;
                        break;
                }
            }
        };
    }
}

@end

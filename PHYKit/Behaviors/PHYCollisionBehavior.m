//
//  PHYDynamicCollisionBehavior.m
//  PHYKit
//
//  Created by Nora Trapp on 6/29/13.
//  Copyright (c) 2013 Nora Trapp and Zev Eisenberg. All rights reserved.
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

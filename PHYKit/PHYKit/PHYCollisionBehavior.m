//
//  PHYDynamicCollisionBehavior.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/29/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "PHYCollisionBehavior.h"

@interface PHYCollisionBehavior ()
{
    NSMutableSet *_items;
}

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

@end

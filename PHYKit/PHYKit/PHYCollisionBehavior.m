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
    NSMutableArray *_items;
}

@end

@implementation PHYCollisionBehavior

- (instancetype)initWithItems:(NSArray *)items
{
    if ((self = [super init]))
    {
        _items = [NSMutableArray arrayWithArray:items];
    }
    
    return self;
}


- (void)addItem:(id <PHYDynamicItem>)item
{
    [_items addObject:item];
}

- (void)removeItem:(id <PHYDynamicItem>)item
{
    [_items removeObject:item];
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

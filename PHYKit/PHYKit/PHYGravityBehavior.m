//
//  PHYDynamicGravityBehavior.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/28/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "PHYGravityBehavior.h"

@interface PHYGravityBehavior ()
{
    NSMutableArray *_items;
}

@end

@implementation PHYGravityBehavior

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

- (void)setXComponent:(CGFloat)x yComponent:(CGFloat)y
{
    self.xComponent = x;
    self.yComponent = y;
}

@end

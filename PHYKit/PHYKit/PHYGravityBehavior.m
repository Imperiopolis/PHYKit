//
//  PHYDynamicGravityBehavior.m
//  PHYKit
//
//  Created by Nora Trapp on 6/28/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
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
        self.xComponent = 0;
        self.yComponent = 1;
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

- (void)setXComponent:(CGFloat)x yComponent:(CGFloat)y
{
    self.xComponent = x;
    self.yComponent = y;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; gravity = <%f, %f>>", [self className], self, self.xComponent, self.yComponent];
}

@end

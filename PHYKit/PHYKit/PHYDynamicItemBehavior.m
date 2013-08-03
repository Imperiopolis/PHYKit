//
//  PHYDynamicItemBehavior.m
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import "PHYDynamicItemBehavior.h"

@interface PHYDynamicItemBehavior ()
{
    NSMutableSet *_items;
}

@end

@implementation PHYDynamicItemBehavior

- (instancetype)initWithItems:(NSArray *)items
{
    if ((self = [super init]))
    {
        _items = [NSMutableSet setWithArray: items];
    }
    return self;
}

- (NSArray*)items
{
    return [_items allObjects];
}

- (void)addItem:(id <PHYDynamicItem>)item
{
    
}

- (void)removeItem:(id <PHYDynamicItem>)item
{
    
}

- (void)addLinearVelocity:(CGPoint)velocity forItem:(id <PHYDynamicItem>)item
{
    
}

- (CGPoint)linearVelocityForItem:(id <PHYDynamicItem>)item
{
    return CGPointZero;
}

- (void)addAngularVelocity:(CGFloat)velocity forItem:(id <PHYDynamicItem>)item
{
    
}

- (CGFloat)angularVelocityForItem:(id <PHYDynamicItem>)item
{
    return 0;
}

@end

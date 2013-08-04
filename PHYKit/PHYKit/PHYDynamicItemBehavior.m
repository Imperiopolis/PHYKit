//
//  PHYDynamicItemBehavior.m
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import "PHYDynamicItemBehavior.h"
#import "PHYDynamicAnimator.h"
#import "PHYBody.h"

@interface PHYDynamicAnimator (PHYPrivateAnimator)

- (PHYBody*)bodyFromDynamicItem:(id <PHYDynamicItem>)dynamicItem;

@end

@interface PHYDynamicItemBehavior ()
{
    NSMutableSet *_items;
    void (^_action)(void);
}

@property (nonatomic, copy) void (^internalAction)(void);

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

    if (animator)
    {
        __weak typeof(self) bself = self;

        self.internalAction = ^{

            for (id<PHYDynamicItem> dynamicItem in bself.items)
            {
                PHYBody *body = [animator bodyFromDynamicItem:dynamicItem];

                if (body)
                {
                    body.restitution = bself.elasticity;
                    body.friction = bself.friction;
                    body.density = bself.density;
                    body.allowsRotation = bself.allowsRotation;
                }
            }
        };
    }
}

@end

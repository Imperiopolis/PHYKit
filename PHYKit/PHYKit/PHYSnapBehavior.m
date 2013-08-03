//
//  PHYSnapBehavior.m
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "PHYSnapBehavior.h"
#import "PHYDynamicAnimator.h"
#import "PHYBody.h"

@interface PHYDynamicAnimator (PHYSnapAnimator)

- (PHYBody*)bodyFromDynamicItem:(id <PHYDynamicItem>)dynamicItem;

@end

@interface PHYSnapBehavior ()
{
    NSMutableSet *_items;
}

@property (assign) CGPoint point;

@end

@implementation PHYSnapBehavior

- (instancetype)initWithItem:(id <PHYDynamicItem>)item snapToPoint:(CGPoint)point
{
    self = [super init];
    if (self)
    {
        _items = [NSMutableSet setWithObject: item];
        self.damping = 0.5;
        self.point = point;
    }
    return self;
}

- (NSArray*)items
{
    return [_items allObjects];
}

- (void)willMoveToAnimator:(PHYDynamicAnimator *)animator
{
    if (animator)
    {
        PHYBody *body = [animator bodyFromDynamicItem: [self.items lastObject]];
        __weak typeof(self) bself = self;
        
        if (body)
        {
            self.action = ^{
                body.linearDamping = bself.damping;
                body.velocity = CGPointMake((bself.point.x - body.position.x) * 5, (bself.point.y - body.position.y) * 5);
                
                if (ceil(body.position.x) == ceil(bself.point.x) && ceil(body.position.y) == ceil(bself.point.y))
                {
                    body.velocity = CGPointMake(0, 0);
                }
            };
        }
    }
}

@end

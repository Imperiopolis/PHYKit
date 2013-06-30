//
//  PHYDynamicAnimator.m
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import "PHYDynamicAnimator.h"
#import "PHYDynamicBehavior.h"
#import "PHYGravityBehavior.h"

@interface PHYDynamicAnimator ()
{
    NSMutableArray *_behaviors;
    NSUInteger _elapsedMillis;
}
@property (nonatomic, strong) NSView *referenceView;
@property (nonatomic) NSTimeInterval elapsedTime;
@property (nonatomic, weak) NSTimer *physicsTimer;
@property (nonatomic, weak) NSThread *thread;
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation PHYDynamicAnimator

- (instancetype)initWithReferenceView:(NSView*)view
{
    if ((self = [super init]))
    {
        self.referenceView = view;
        self.items = [NSMutableArray array];
        _behaviors = [NSMutableArray array];
        self.thread = [NSThread currentThread];
    }
    
    return self;
}

- (void)addBehavior:(PHYDynamicBehavior *)behavior
{
    [_behaviors addObject:behavior];
    
    if ([behavior respondsToSelector:@selector(items)])
    {
        [self.items addObjectsFromArray: [(id) behavior items]];
    }
    
    [self startPhysics];
}

- (void)removeBehavior:(PHYDynamicBehavior *)behavior
{
    [_behaviors removeObject:behavior];
    
    if (![_behaviors count])
    {
        [self stopPhysics];
    }
}

- (void)removeAllBehaviors
{
    [_behaviors removeAllObjects];
    
    [self stopPhysics];
}

- (NSArray*)itemsInRect:(CGRect)rect
{
    NSMutableArray *items = [NSMutableArray array];
    
    for (id <PHYDynamicItem> item in self.items)
    {
#warning update this to use the transform to take rotation into account
        CGPoint itemCenter = item.center;
        CGRect itemBounds = NSRectToCGRect(item.bounds);
        
        CGRect itemRect = CGRectMake(itemCenter.x - CGRectGetWidth(itemBounds) / 2,
                                     itemCenter.y - CGRectGetHeight(itemBounds) / 2,
                                     itemBounds.size.width,
                                     itemBounds.size.height);
        
        if (CGRectIntersectsRect(rect, itemRect))
        {
            [items addObject: item];
        }
    }
    
    return items;
}

// starts when a new behavior or item is added
- (void)startPhysics
{
    [self.delegate dynamicAnimatorWillResume:self];
    
    [NSThread detachNewThreadSelector:@selector(updatePhysics)
                             toTarget:self
                           withObject:nil];
}

// stops when we reach a state of rest or all behaviors and items are removed
- (void)stopPhysics
{
    [self.physicsTimer invalidate];
    self.physicsTimer = nil;
    
    [self.delegate dynamicAnimatorDidPause:self];
}

- (void)updatePhysics
{
    self.physicsTimer = [NSTimer scheduledTimerWithTimeInterval:0.001
                                                         target:self
                                                       selector:@selector(updatePhysicsWithTimer:)
                                                       userInfo:nil
                                                        repeats:YES];
    [[NSRunLoop currentRunLoop] run];
}

- (NSTimeInterval)elapsedTime
{
    return (NSTimeInterval)_elapsedMillis / 1000;
}

- (void)updatePhysicsWithTimer:(NSTimer*)timer
{
    _elapsedMillis += 1;
    
    for (id <PHYDynamicItem> item in self.items)
    {
        CGPoint distance = CGPointZero;
        
        for (PHYDynamicBehavior *behavior in self.behaviors)
        {
            if ([behavior isKindOfClass:[PHYGravityBehavior class]])
            {                
                distance = CGPointMake(.5 * [(PHYGravityBehavior *)behavior xComponent] * (self.elapsedTime * self.elapsedTime),
                                       .5 * [(PHYGravityBehavior *)behavior yComponent] * (self.elapsedTime * self.elapsedTime));
            }
        }
        
        // update at 60Hz, and when we have data
        if (!CGPointEqualToPoint(distance, CGPointZero) &&
            ((_elapsedMillis % 16) == 0))
        {
            CGPoint point = item.center;
            point.x += distance.x;
            point.y += distance.y;
            item.center = point;
        }
    }
}

@end

//
//  PHYDynamicAnimator.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import "PHYDynamicAnimator.h"
#import "PHYDynamicBehavior.h"
#import "PHYGravityBehavior.h"

@interface PHYDynamicAnimator ()
{
    NSMutableArray *_behaviors;
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
        // this check is not right, need to see if any of the object is in the rect, not just the center
        if (CGRectContainsPoint(rect, item.center))
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
                                                       selector:@selector(_updatePhysics:)
                                                       userInfo:nil
                                                        repeats:YES];
    
    [[NSRunLoop currentRunLoop] run];
}

- (void)_updatePhysics:(NSTimer*)timer
{
    self.elapsedTime += 0.001;
    
    for (id <PHYDynamicItem> item in self.items)
    {
        CGPoint distance;
        
        for (PHYDynamicBehavior *behavior in self.behaviors)
        {
            if ([behavior isKindOfClass:[PHYGravityBehavior class]])
            {                
                distance = CGPointMake(.5 * [(PHYGravityBehavior*)behavior xComponent] * (self.elapsedTime*self.elapsedTime), .5 * [(PHYGravityBehavior*)behavior yComponent] * (self.elapsedTime*self.elapsedTime));
            }
        }
        
        if (!CGPointEqualToPoint(distance, CGPointZero))
        {
            CGPoint point = item.center;
            point.x += distance.x;
            point.y += distance.y;
            item.center = point;
        }
    }
    
    // stop, everything is off screen. also need to check for equilibrium
    if (![[self itemsInRect:self.referenceView.frame] count])
    {
        [self stopPhysics];
    }
}

@end

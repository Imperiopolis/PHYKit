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
#import <QuartzCore/QuartzCore.h>
#import <CoreVideo/CoreVideo.h>
#import "PHYWorld.h"

#define kGravityScaleFactory    (1000)

@interface PHYDynamicAnimator ()
{
    NSMutableArray *_behaviors;
    CVDisplayLinkRef _displayLink;
}

@property (nonatomic, strong) PHYWorld *world;

@property (nonatomic, strong) NSView *referenceView;
@property (nonatomic) NSTimeInterval elapsedTime;
@property (nonatomic, weak) NSThread *thread;
@property (nonatomic) NSTimeInterval startTime;
@property (nonatomic) NSTimeInterval lastTime;
@property (assign) BOOL isSimulating;
@end

@implementation PHYDynamicAnimator

static CVReturn displayLinkCallback(CVDisplayLinkRef displayLink, const CVTimeStamp* now, const CVTimeStamp* outputTime, CVOptionFlags flagsIn, CVOptionFlags* flagsOut, void* displayLinkContext)
{
    [(__bridge PHYDynamicAnimator*)displayLinkContext updatePhysics];
    
    return kCVReturnSuccess;
}

- (instancetype)initWithReferenceView:(NSView*)view
{
    if ((self = [super init]))
    {
        self.world = [PHYWorld world];
        self.referenceView = view;
        _behaviors = [NSMutableArray array];
        self.thread = [NSThread currentThread];
        
        
        CVDisplayLinkCreateWithActiveCGDisplays(&_displayLink);
        
        // Set the renderer output callback function
        CVDisplayLinkSetOutputCallback(_displayLink, &displayLinkCallback, (__bridge void*)self);
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    switch ((NSKeyValueChange)[[change objectForKey:@"kind"] unsignedIntegerValue]) {
        case NSKeyValueChangeRemoval:
        {
            PHYDynamicBehavior *behavior = (PHYDynamicBehavior*)object;
            if ([behavior respondsToSelector:@selector(items)])
            {
                NSArray *items = [[(id)behavior items] objectsAtIndexes:[change objectForKey:@"indexes"]];
                for (id<PHYDynamicItem> item in items)
                {
                    [self.world removeBody: item];
                }
            }

            BOOL hasItems = NO;

            for (PHYDynamicBehavior *behavior in self.behaviors)
            {
                if ([behavior respondsToSelector:@selector(items)])
                {
                    if ([[(id)behavior items] count])
                    {
                        hasItems = YES;
                        break;
                    }
                }
            }

            if (!hasItems)
            {
                [self stopPhysics];
            }
        }
            break;

        case NSKeyValueChangeInsertion:
        {
            PHYDynamicBehavior *behavior = (PHYDynamicBehavior*)object;
            if ([behavior respondsToSelector:@selector(items)])
            {
                NSArray *items = [[(id)behavior items] objectsAtIndexes:[change objectForKey:@"indexes"]];
                for (id<PHYDynamicItem> item in items)
                {
                    [self.world addBody: item];
                }
            }

            [self startPhysics];
        }
            break;

        default:
            break;
    }
}

- (void)addBehavior:(PHYDynamicBehavior *)behavior
{
    [behavior willMoveToAnimator: self];

    behavior.dynamicAnimator = self;

    [_behaviors addObject: behavior];

    [behavior addObserver:self forKeyPath:@"items" options:0 context:NULL];

    if ([behavior respondsToSelector:@selector(items)])
    {
        NSArray *items = [(id)behavior items];
        for (id<PHYDynamicItem> item in items)
        {
            [self.world addBody: item];
        }
    }

    if ([behavior isKindOfClass:[PHYGravityBehavior class]])
    {
        PHYGravityBehavior *gravity = (PHYGravityBehavior*)behavior;
        self.world.gravity = CGPointMake(gravity.gravityDirection.width * kGravityScaleFactory, gravity.gravityDirection.height * kGravityScaleFactory);
    }

    if ([_behaviors count])
    {
        [self startPhysics];
    }
}

- (void)removeBehavior:(PHYDynamicBehavior *)behavior
{
    [_behaviors removeObject:behavior];

    [behavior removeObserver:self forKeyPath:@"items"];
    behavior.dynamicAnimator = nil;

    if ([behavior respondsToSelector:@selector(items)])
    {
        NSArray *items = [(id)behavior items];
        for (id<PHYDynamicItem> item in items)
        {
            [self.world removeBody: item];
        }
    }

    if ([_behaviors count])
    {
        [self startPhysics];
    }
    else
    {
        [self stopPhysics];
    }
}

- (void)removeAllBehaviors
{
    for (PHYDynamicBehavior *behavior in _behaviors)
    {
        [behavior removeObserver:self forKeyPath:@"items"];
        behavior.dynamicAnimator = nil;
    }

    [_behaviors removeAllObjects];
    [self.world removeAllBodies];
    
    [self stopPhysics];
}

- (NSArray*)itemsInRect:(CGRect)rect
{
    NSMutableArray *items = [NSMutableArray array];

    for (PHYDynamicBehavior *behavior in self.behaviors)
    {
        if ([behavior respondsToSelector:@selector(items)])
        {
            for (id <PHYDynamicItem> item in [(id)behavior items])
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
        }
    }
    
    return items;
}

// starts when a new behavior or item is added
- (void)startPhysics
{
    if (!self.isSimulating)
    {
        self.isSimulating = YES;
        [self.delegate dynamicAnimatorWillResume:self];
        self.startTime = [NSDate timeIntervalSinceReferenceDate];
        self.lastTime = self.startTime - 1.0/60;

        CVDisplayLinkStart(_displayLink);
    }
}

// stops when we reach a state of rest or all behaviors and items are removed
- (void)stopPhysics
{
    if (self.isSimulating)
    {
        self.isSimulating = NO;
        CVDisplayLinkStop(_displayLink);
        [self.delegate dynamicAnimatorDidPause:self];
    }
}

- (void)updatePhysics
{
    @autoreleasepool
    {
        NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];

        [self.world stepWithTime:(now - self.lastTime)];

        self.lastTime = now;
        self.elapsedTime = self.lastTime - self.startTime;
    }
}

@end

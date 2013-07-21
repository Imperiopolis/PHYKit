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
#import <QuartzCore/QuartzCore.h>
#import <CoreVideo/CoreVideo.h>

@interface PHYDynamicAnimator ()
{
    NSMutableArray *_behaviors;
    CVDisplayLinkRef _displayLink;
}
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
            [self startPhysics];
            break;

        default:
            break;
    }
}

- (void)addBehavior:(PHYDynamicBehavior *)behavior
{
    [_behaviors addObject: behavior];

    [behavior addObserver:self forKeyPath:@"items" options:0 context:NULL];

    [self startPhysics];
}

- (void)removeBehavior:(PHYDynamicBehavior *)behavior
{
    [_behaviors removeObject:behavior];

    [behavior removeObserver:self forKeyPath:@"items"];

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
    //TODO: this should really all be Box2D based on Apple Header dumps
    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    
    CGPoint velocity = CGPointZero;
    NSMutableArray *items = [NSMutableArray array];

    for (PHYDynamicBehavior *behavior in self.behaviors)
    {
        if ([behavior respondsToSelector:@selector(items)])
        {
            [items addObjectsFromArray: [(id)behavior items]];
        }

        // Calculate Gravity
        if ([behavior isKindOfClass:[PHYGravityBehavior class]])
        {
            NSTimeInterval elapsedTime = self.elapsedTime;
            velocity = CGPointMake(([(PHYGravityBehavior *)behavior xComponent] * 1000) * elapsedTime,
                                   ([(PHYGravityBehavior *)behavior yComponent] * 1000) * elapsedTime);
        }
    }

    for (id <PHYDynamicItem>item in items)
    {
        CGPoint point = item.center;
        point.x += velocity.x * (now - self.lastTime);
        point.y += velocity.y * (now - self.lastTime);

        // Update item center and transform on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            item.center = point;
        });
    }

    self.lastTime = now;
    self.elapsedTime = self.lastTime - self.startTime;
}

@end

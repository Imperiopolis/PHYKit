//
//  PHYDynamicAnimator.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import "PHYDynamicAnimator.h"

@interface PHYDynamicAnimator ()
@property (nonatomic, strong) NSView *referenceView;
@end

@implementation PHYDynamicAnimator

- (instancetype)initWithReferenceView:(NSView*)view
{
    if ((self = [super init]))
    {
        self.referenceView = view;
    }
    
    return self;
}

- (void)addBehavior:(PHYDynamicBehavior *)behavior
{
    
}

- (void)removeBehavior:(PHYDynamicBehavior *)behavior
{
    
}

- (void)removeAllBehaviors
{
    
}

- (NSArray*)itemsInRect:(CGRect)rect
{
    return nil;
}

- (NSTimeInterval)elapsedTime
{
    return 0;
}

@end

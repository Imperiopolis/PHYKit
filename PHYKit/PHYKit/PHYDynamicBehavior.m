//
//  PHYDynamicBehavior.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import "PHYDynamicBehavior.h"
#import "PHYDynamicAnimator.h"

@interface PHYDynamicBehavior ()

@property (nonatomic, weak) PHYDynamicAnimator *dynamicAnimator;

@end

@implementation PHYDynamicBehavior

- (void)addChildBehavior:(PHYDynamicBehavior *)behavior
{
    
}

- (void)removeChildBehavior:(PHYDynamicBehavior *)behavior
{
    
}

- (void)willMoveToAnimator:(PHYDynamicAnimator *)animator
{
    self.dynamicAnimator = animator;
}

@end

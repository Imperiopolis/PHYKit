//
//  ContinuousPushViewController.m
//  Newton
//
//  Created by Zev Eisenberg on 8/2/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "ContinuousPushViewController.h"

@interface ContinuousPushViewController () <PHYViewDelegate>

@property (nonatomic, weak) IBOutlet PHYView *square1;
@property (nonatomic, weak) IBOutlet PHYView *vectorView;
@property (nonatomic) PHYDynamicAnimator* animator;
@property (nonatomic) PHYPushBehavior* pushBehavior;

@end

@implementation ContinuousPushViewController

-(void)awakeFromNib
{
    self.square1.backgroundColor = [NSColor grayColor];
    self.vectorView.backgroundColor = [NSColor redColor];
    [(PHYView*)self.view setDelegate: self];

    PHYDynamicAnimator* animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];

    PHYCollisionBehavior* collisionBehavior = [[PHYCollisionBehavior alloc] initWithItems:@[self.square1]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];

    PHYPushBehavior *pushBehavior = [[PHYPushBehavior alloc] initWithItems:@[self.square1] mode:PHYPushBehaviorModeContinuous];
    pushBehavior.angle = 0.0;
    pushBehavior.magnitude = 0.0;
    [animator addBehavior:pushBehavior];
    self.pushBehavior = pushBehavior;

    self.animator = animator;

    self.vectorView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    self.vectorView.layer.anchorPoint = CGPointMake(0.0,0.5);
}

- (void)viewClicked:(NSEvent *)event
{
    /*
     Tapping in the view changes the angle and magnitude of the force. To visually show the force vector on screen, a red line is drawn representing the angle and magnitude of this vector. The force is continuously applied while the behavior is active, so we keep the vector line visible and just update its size and rotation to represent the vector.
     */
    CGPoint p = [self.view convertPoint:event.locationInWindow fromView:nil];
    CGPoint o = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    CGFloat distance = sqrtf(powf(p.x-o.x, 2.0)+powf(p.y-o.y, 2.0));
    CGFloat angle = atan2(p.y-o.y,p.x-o.x);
    distance = MIN(distance, 200.0);

    self.vectorView.bounds = CGRectMake(0.0, 0.0, distance, 5.0);
    self.vectorView.transform = CGAffineTransformMakeRotation(angle);

    // These two lignes change the actual force vector
    [self.pushBehavior setMagnitude:distance / 100.0];
    [self.pushBehavior setAngle:angle];
}

@end

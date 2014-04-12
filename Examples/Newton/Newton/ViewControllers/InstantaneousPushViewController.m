//
//  InstantaneousPushViewController.m
//  Newton
//
//  Created by Zev Eisenberg on 8/2/13.
//  Copyright (c) 2013 Nathan Trapp and Zev Eisenberg. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "InstantaneousPushViewController.h"

@interface InstantaneousPushViewController () <PHYViewDelegate>

@property (nonatomic, weak) IBOutlet PHYView *square1;
@property (nonatomic, weak) IBOutlet PHYView *vectorView;
@property (nonatomic) PHYDynamicAnimator* animator;
@property (nonatomic) PHYPushBehavior* pushBehavior;

@end

@implementation InstantaneousPushViewController

- (void)awakeFromNib
{
    self.square1.backgroundColor = [NSColor grayColor];
    self.vectorView.backgroundColor = [NSColor redColor];
    [(PHYView*)self.view setDelegate: self];

    PHYDynamicAnimator* animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];

    PHYCollisionBehavior* collisionBehavior = [[PHYCollisionBehavior alloc] initWithItems:@[self.square1]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];

    PHYPushBehavior *pushBehavior = [[PHYPushBehavior alloc] initWithItems:@[self.square1] mode:PHYPushBehaviorModeInstantaneous];
    pushBehavior.angle = 0.0;
    pushBehavior.magnitude = 0.0;

    self.pushBehavior = pushBehavior;
    [animator addBehavior:self.pushBehavior];

    self.animator = animator;

    self.vectorView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    self.vectorView.layer.anchorPoint = CGPointMake(0.0,0.5);
}

- (void)viewClicked:(NSEvent *)event
{
    /*
     Tapping will change the angle and magnitude of the impulse. To visually show the impulse vector on screen, a red line representing the angle and magnitude of this vector is briefly drawn.
     */
    CGPoint p = [self.view convertPoint:event.locationInWindow fromView:nil];
    CGPoint o = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    CGFloat distance = sqrtf(powf(p.x-o.x, 2.0)+powf(p.y-o.y, 2.0));
    CGFloat angle = atan2(p.y-o.y,p.x-o.x);
    distance = MIN(distance, 100.0);

    self.vectorView.bounds = CGRectMake(0.0, 0.0, distance, 5.0);
    self.vectorView.transform = CGAffineTransformMakeRotation(angle);
    
    [PHYView animateWithDuration:0.1 animations:^{
        self.vectorView.alpha = 1;
    } completion:^{
        [PHYView animateWithDuration:1.0 animations:^{
            self.vectorView.alpha = 0.0;
        }];
    }];

    // These two lines change the actual force vector.
    [self.pushBehavior setMagnitude:distance / 100.0];
    [self.pushBehavior setAngle:angle];
    /*
     A push behavior in instantaneous (impulse) mode automatically deactivate itself after applying the impulse. We thus need to reactivate it when changing the impulse vector.
     */
    [self.pushBehavior setActive:YES];
}

@end

//
//  ItemPropertiesViewController.m
//  Newton
//
//  Created by Zev Eisenberg on 8/2/13.
//  Copyright (c) 2013 Nora Trapp and Zev Eisenberg. All rights reserved.
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

#import "ItemPropertiesViewController.h"

@interface ItemPropertiesViewController ()

@property (nonatomic, weak) IBOutlet PHYView *square1;
@property (nonatomic, weak) IBOutlet PHYView *square2;
@property (nonatomic) PHYDynamicAnimator* animator;

@end

@implementation ItemPropertiesViewController

- (void)awakeFromNib
{
    self.square1.backgroundColor = [NSColor grayColor];
    self.square2.backgroundColor = [NSColor grayColor];

    PHYDynamicAnimator* animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];
    /*
     We want to show collisions between views and boundaries with different elasticities, we thus associate the two views to gravity and collision behaviors. We will only change the restitution parameter for one of these views.
     */
    PHYGravityBehavior* gravityBeahvior = [[PHYGravityBehavior alloc] initWithItems:@[self.square1, self.square2]];
    PHYCollisionBehavior* collisionBehavior = [[PHYCollisionBehavior alloc] initWithItems:@[self.square1, self.square2]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;

    /*
     A dynamic item behavior gives access to low-level properties of an item in Dynamics, here we change restitution on collisions only for square2, and keep square1 with its default value.
     */
    PHYDynamicItemBehavior* propertiesBehavior = [[PHYDynamicItemBehavior alloc] initWithItems:@[self.square2]];
    propertiesBehavior.elasticity = 0.5;

    [animator addBehavior:propertiesBehavior];
    [animator addBehavior:gravityBeahvior];
    [animator addBehavior:collisionBehavior];

    self.animator = animator;
}

@end

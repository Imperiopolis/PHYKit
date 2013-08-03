//
//  ItemPropertiesViewController.m
//  Newton
//
//  Created by Zev Eisenberg on 8/2/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

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

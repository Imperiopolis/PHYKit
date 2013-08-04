//
//  CollisionGravitySpringViewController.m
//  Newton
//
//  Created by Zev Eisenberg on 8/2/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "CollisionGravitySpringViewController.h"

@interface CollisionGravitySpringViewController () <PHYViewDelegate>

@property (nonatomic, weak) IBOutlet PHYView *square1;
@property (nonatomic, weak) IBOutlet PHYView *redSquare;
@property (nonatomic, weak) IBOutlet PHYView *blueSquare;
@property (nonatomic) PHYDynamicAnimator* animator;
@property (nonatomic) PHYAttachmentBehavior* attachmentBehavior;

@end

@implementation CollisionGravitySpringViewController

- (void)awakeFromNib
{
    [(PHYView*)self.view setDelegate: self];
    
    self.square1.backgroundColor = [NSColor grayColor];
    self.redSquare.backgroundColor = [NSColor redColor];
    self.blueSquare.backgroundColor = [NSColor blueColor];

    PHYDynamicAnimator* animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];
    PHYGravityBehavior* gravityBeahvior = [[PHYGravityBehavior alloc] initWithItems:@[self.square1]];
    PHYCollisionBehavior* collisionBehavior = [[PHYCollisionBehavior alloc] initWithItems:@[self.square1]];

    CGPoint anchorPoint = CGPointMake(self.square1.center.x, self.square1.center.y - 100.0);
    PHYAttachmentBehavior* attachmentBehavior = [[PHYAttachmentBehavior alloc] initWithItem:self.square1 attachedToAnchor:anchorPoint];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    // These parameters set the attachment in spring mode, instead of a rigid connection.
    [attachmentBehavior setFrequency:1.0];
    [attachmentBehavior setDamping:0.1];

    // Show the attachment points
    self.redSquare.center = attachmentBehavior.anchorPoint;
    self.blueSquare.center = CGPointMake(50.0, 50.0);

    [animator addBehavior:attachmentBehavior];
    [animator addBehavior:collisionBehavior];
    [animator addBehavior:gravityBeahvior];
    self.animator = animator;

    self.attachmentBehavior = attachmentBehavior;
}

- (void)viewDragged:(NSEvent *)event
{
    [self.attachmentBehavior setAnchorPoint:[self.view convertPoint:event.locationInWindow fromView:nil]];
    self.redSquare.center = self.attachmentBehavior.anchorPoint;
}

@end

//
//  CollisionGravityViewController.m
//  Newton
//
//  Created by Zev Eisenberg on 8/2/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "CollisionGravityViewController.h"

@interface CollisionGravityViewController ()<PHYCollisionBehaviorDelegate>

@property (weak) IBOutlet PHYView *square1;
@property (nonatomic) PHYDynamicAnimator *animator;

@end

@implementation CollisionGravityViewController

- (void)awakeFromNib
{
    self.square1.backgroundColor = [NSColor grayColor];

    PHYDynamicAnimator *animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];
        
    PHYGravityBehavior* gravityBeahvior = [[PHYGravityBehavior alloc] initWithItems:@[self.square1]];
    PHYCollisionBehavior* collisionBehavior = [[PHYCollisionBehavior alloc] initWithItems:@[self.square1]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:gravityBeahvior];
    [animator addBehavior:collisionBehavior];
    collisionBehavior.collisionDelegate = self;

    self.animator = animator;
}

-(void)collisionBehavior:(PHYCollisionBehavior *)behavior beganContactForItem:(id<PHYDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    // Lighten the background color when the view is in contact with a boundary.
    [(PHYView*)item setBackgroundColor:[NSColor lightGrayColor]];
}


-(void)collisionBehavior:(PHYCollisionBehavior *)behavior endedContactForItem:(id<PHYDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
    // Restore the default color when ending a contcact.
    [(PHYView*)item setBackgroundColor:[NSColor grayColor]];
}

@end

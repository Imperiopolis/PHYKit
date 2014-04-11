//
//  CollisionGravityViewController.m
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

#import "CollisionGravityViewController.h"

@interface CollisionGravityViewController () <PHYCollisionBehaviorDelegate>

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

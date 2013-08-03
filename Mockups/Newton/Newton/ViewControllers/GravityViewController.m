//
//  GravityViewController.m
//  Newton
//
//  Created by Nora Trapp on 8/1/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()

@property (weak) IBOutlet PHYView *square1;
@property (nonatomic) PHYDynamicAnimator *animator;


@end

@implementation GravityViewController

- (void)awakeFromNib
{
    self.square1.backgroundColor = [NSColor grayColor];
    
    PHYDynamicAnimator* animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];
    PHYGravityBehavior* gravityBeahvior = [[PHYGravityBehavior alloc] initWithItems:@[self.square1]];
    [animator addBehavior:gravityBeahvior];
    self.animator = animator;
}

@end

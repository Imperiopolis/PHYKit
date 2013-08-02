//
//  GravityViewController.m
//  Newton
//
//  Created by Nora Trapp on 8/1/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()

@property (weak) IBOutlet PHYView *dropView;
@property (nonatomic) PHYDynamicAnimator *animator;


@end

@implementation GravityViewController

- (void)awakeFromNib
{
    self.dropView.backgroundColor = [NSColor greenColor];
    self.animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];

    PHYGravityBehavior *gravity = [[PHYGravityBehavior alloc] initWithItems:@[self.dropView]];

    [self.animator addBehavior:gravity];
}

@end

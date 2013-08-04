//
//  SnapViewController.m
//  Newton
//
//  Created by Zev Eisenberg on 8/2/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController () <PHYViewDelegate>

@property (nonatomic, weak) IBOutlet PHYView *square1;
@property (nonatomic, strong) PHYDynamicAnimator *animator;
@property (nonatomic, strong) PHYSnapBehavior *snapBehavior;

@end

@implementation SnapViewController

- (void)awakeFromNib
{
    self.square1.backgroundColor = [NSColor grayColor];
    [(PHYView*)self.view setDelegate: self];

    self.animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)viewClicked:(NSEvent *)theEvent
{
    NSPoint point = [self.view convertPoint:theEvent.locationInWindow fromView:nil];

    [self.animator removeBehavior: self.snapBehavior];

    self.snapBehavior = [[PHYSnapBehavior alloc] initWithItem:self.square1 snapToPoint:point];
    [self.animator addBehavior: self.snapBehavior];
}

@end

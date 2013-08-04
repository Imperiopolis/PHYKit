//
//  AttachmentsViewController.m
//  Newton
//
//  Created by Zev Eisenberg on 8/2/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "AttachmentsViewController.h"

@interface AttachmentsViewController () <PHYViewDelegate>

@property (nonatomic, weak) IBOutlet PHYView *square1;
@property (nonatomic, weak) IBOutlet PHYView *redSquare;
@property (nonatomic, weak) IBOutlet PHYView *blueSquare;
@property (nonatomic) PHYDynamicAnimator* animator;
@property (nonatomic) PHYAttachmentBehavior* attachmentBehavior;

@end

@implementation AttachmentsViewController

- (void)awakeFromNib
{
    [(PHYView*)self.view setDelegate: self];

    self.square1.backgroundColor = [NSColor grayColor];
    self.redSquare.backgroundColor = [NSColor redColor];
    self.blueSquare.backgroundColor = [NSColor blueColor];

    PHYDynamicAnimator* animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.view];
    PHYCollisionBehavior* collisionBehavior = [[PHYCollisionBehavior alloc] initWithItems:@[self.square1]];

    CGPoint squareCenterPoint = CGPointMake(self.square1.center.x, self.square1.center.y - 100.0);
    PHYOffset attachmentPoint = PHYOffsetMake(-25.0, -25.0);
    /*
     By default, an attachment behavior uses the center of a view. By using a small offset, we get a more interesting effect which will cause the view to have rotation movement when dragging the attachment.
     */
    PHYAttachmentBehavior* attachmentBehavior = [[PHYAttachmentBehavior alloc] initWithItem:self.square1 offsetFromCenter:attachmentPoint attachedToAnchor:squareCenterPoint];

    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;

    // Show visually the attachment points
    self.redSquare.center = attachmentBehavior.anchorPoint;
    self.blueSquare.center = CGPointMake(25.0, 25.0);

    [animator addBehavior:attachmentBehavior];
    self.animator = animator;

    self.attachmentBehavior = attachmentBehavior;
}

- (void)viewDragged:(NSEvent *)event
{
    [self.attachmentBehavior setAnchorPoint:[self.view convertPoint:event.locationInWindow fromView:nil]];
    self.redSquare.center = self.attachmentBehavior.anchorPoint;
}

@end

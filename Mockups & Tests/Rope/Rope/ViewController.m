//
//  ViewController.m
//  Rope
//
//  Created by Zev Eisenberg on 7/9/13.
//  Copyright (c) 2013 Zev Eisenberg. All rights reserved.
//

#import "ViewController.h"

#define kThickness 5.0
#define kSegmentLength 40.0
#define kYOffset 50.0
#define kSegmentCount 10

#define kFrequency 20
#define kDamping .8

#define kTopFrequency 10
#define kTopDamping 0

@interface ViewController ()

@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) NSMutableArray *viewsArray;
@property (strong, nonatomic) UIAttachmentBehavior *topAttachment;
@property (strong, nonatomic) NSArray *attachments;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
	
    NSMutableArray *viewsArray = [NSMutableArray array];
    NSMutableArray *attachmentsArray = [NSMutableArray arrayWithCapacity:kSegmentCount - 1];

    for (NSInteger i = 0; i < kSegmentCount; i++)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) - kThickness) / 2, i * kSegmentLength + kYOffset, kThickness, kSegmentLength)];
        view.backgroundColor = [UIColor grayColor];
        [self.view addSubview:view];
        
        if (i == 0)
        {
            self.topAttachment = [[UIAttachmentBehavior alloc] initWithItem:view point:CGPointMake(0, -CGRectGetHeight(view.frame) / 2) attachedToAnchor:CGPointMake(CGRectGetWidth(self.view.bounds) / 2, kYOffset)];
            self.topAttachment.frequency = kTopDamping;
            self.topAttachment.damping = kTopDamping;
            [animator addBehavior:self.topAttachment];
        }
        else
        {
            UIView *attachToView = [viewsArray lastObject];
            UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:view point:CGPointMake(0, -CGRectGetHeight(view.frame) / 2) attachedToItem:attachToView point:CGPointMake(0, CGRectGetHeight(attachToView.frame) / 2)];
            attachment.frequency = kFrequency;
            attachment.damping = kDamping;
            [animator addBehavior:attachment];
            [attachmentsArray addObject:attachment];
        }
        
        [viewsArray addObject:view];
        self.attachments = [NSArray arrayWithArray:attachmentsArray];
    }
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:viewsArray];
    
    [animator addBehavior:gravity];
    
    self.animator = animator;

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
    
    self.viewsArray = viewsArray;
}

- (void)handlePan:(UIPanGestureRecognizer *)pan
{
    [self.topAttachment setAnchorPoint:[pan locationInView:self.view]];
}


@end

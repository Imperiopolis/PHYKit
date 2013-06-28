//
//  ViewController.m
//  Snapper
//
//  Created by Zev Eisenberg on 6/19/13.
//  Copyright (c) 2013 Zev Eisenberg. All rights reserved.
//

#import "ViewController.h"

#define kPadding 20.0
#define kSnapHeight 2.0

#define kBottomSnapPoint 300.0
#define kTopSnapPoint 50.0

CGFloat clamp(CGFloat num, CGFloat min, CGFloat max)
{
    return MAX(min, MIN(max, num));
}

@interface ViewController ()

@property (strong, nonatomic) UIView *anchorView;
@property (strong, nonatomic) UIView *movingView;
@property (strong, nonatomic) UIView *topSnapView;
@property (strong, nonatomic) UIView *bottomSnapView;
@property (strong, nonatomic) UIView *resizingView;

@property (strong, nonatomic) UIDynamicAnimator *animator;
//@property (strong, nonatomic) UISnapBehavior *snapBehavior;
@property (strong, nonatomic) UIDynamicBehavior *snapDynamicBehavior;
@property (strong, nonatomic) UIDynamicItemBehavior *noRotateBehavior;

@property (nonatomic, assign) CGFloat thingWidth;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.thingWidth = CGRectGetWidth(self.view.bounds) - 2 * kPadding;
    
    self.topSnapView = [[UIView alloc] initWithFrame:CGRectMake(0, kTopSnapPoint, kPadding * 2 / 3, kSnapHeight)];
    self.topSnapView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.topSnapView];
    
    self.bottomSnapView = [[UIView alloc] initWithFrame:CGRectMake(0, kBottomSnapPoint, kPadding * 2 / 3, kSnapHeight)];
    self.bottomSnapView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.bottomSnapView];
    
    self.anchorView = [[UIView alloc] initWithFrame:CGRectMake(kPadding, CGRectGetHeight(self.view.bounds) - kPadding - kSnapHeight, self.thingWidth, kSnapHeight)];
    self.anchorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.anchorView];
    
    self.movingView = [[UIView alloc] initWithFrame:CGRectMake(kPadding, kBottomSnapPoint, self.thingWidth, kSnapHeight)];
    self.movingView.backgroundColor = [UIColor colorWithHue:120.0 / 360.0 saturation:0.9 brightness:0.7 alpha:1.0];
    [self.view addSubview:self.movingView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.resizingView = [[UIView alloc] initWithFrame:CGRectMake(kPadding, CGRectGetMinY(self.movingView.frame), self.thingWidth, CGRectGetMaxY(self.anchorView.frame) - CGRectGetMinY(self.movingView.frame))];
    self.resizingView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:.3];
    [self.view addSubview:self.resizingView];
    
    [self.movingView addObserver:self forKeyPath:@"frame" options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.resizingView.frame = CGRectMake(kPadding, CGRectGetMinY(self.movingView.frame), self.thingWidth, CGRectGetMaxY(self.anchorView.frame) - CGRectGetMinY(self.movingView.frame));
}

- (void)handlePan:(UIPanGestureRecognizer *)pan
{
    switch (pan.state)
    {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
        {
            [self.animator removeBehavior:self.snapDynamicBehavior];
            [self.animator removeBehavior:self.noRotateBehavior];
            
            CGRect movingFrame = self.movingView.frame;
            CGFloat translation = [pan translationInView:self.view].y;
            [pan setTranslation:CGPointZero inView:self.view];
            
            CGFloat newY = movingFrame.origin.y + translation;
            newY = clamp(newY, 0, CGRectGetMinY(self.anchorView.frame));
            
            movingFrame.origin.y = newY;
            self.movingView.frame = movingFrame;
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {   
            CGPoint snapPoint = CGPointMake(CGRectGetWidth(self.view.frame) / 2, [self closerSnapY]);
            
            self.snapDynamicBehavior = [[UIDynamicBehavior alloc] init];
            
            UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:self.movingView snapToPoint:snapPoint];
            snapBehavior.damping = 0.3;
            
            [self.snapDynamicBehavior addChildBehavior:snapBehavior];
            __weak ViewController *weakSelf = self;
            self.snapDynamicBehavior.action = ^{
                [weakSelf snapAnimated];
            };
            [self.animator addBehavior:self.snapDynamicBehavior];
            
            self.noRotateBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.movingView]];
            self.noRotateBehavior.allowsRotation = NO;
            [self.animator addBehavior:self.noRotateBehavior];

            break;
        }
        default:
            break;
    }
}

- (void)snapAnimated
{
    CGRect newFrame = CGRectMake(kPadding, CGRectGetMinY(self.movingView.frame), self.thingWidth, CGRectGetMaxY(self.anchorView.frame) - CGRectGetMinY(self.movingView.frame));
    self.resizingView.frame = newFrame;
}

- (CGFloat)closerSnapY
{
    CGFloat currentY = CGRectGetMinY(self.movingView.frame);
    CGFloat distanceToBottom = fabsf(currentY - kBottomSnapPoint);
    CGFloat distanceToTop = fabsf(currentY - kTopSnapPoint);
    
    if (distanceToBottom < distanceToTop)
    {
        return kBottomSnapPoint + kSnapHeight / 2;
    }
    return kTopSnapPoint + kSnapHeight / 2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

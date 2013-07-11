//
//  AppDelegate.m
//  Newton
//
//  Created by Nathan Trapp on 6/28/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "AppDelegate.h"
#import <PHYKit/PHYKit.h>

@interface AppDelegate ()

@property (weak) IBOutlet PHYView *dropView;
@property (nonatomic) PHYDynamicAnimator *animator;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.dropView.backgroundColor = [NSColor greenColor];
    self.animator = [[PHYDynamicAnimator alloc] initWithReferenceView:self.window.contentView];
    
    PHYView *view = [[PHYView alloc] initWithFrame:NSMakeRect(20, 0200, 100, 100)];
    view.backgroundColor = [NSColor blueColor];
    [self.dropView.superview addSubview:view];

    PHYGravityBehavior *gravity = [[PHYGravityBehavior alloc] initWithItems:@[self.dropView, view]];

    [self.animator addBehavior:gravity];
}

@end

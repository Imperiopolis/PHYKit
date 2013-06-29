//
//  AppDelegate.m
//  Newton
//
//  Created by Nora Trapp on 6/28/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
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
    PHYGravityBehavior *gravity = [[PHYGravityBehavior alloc] initWithItems:@[self.dropView]];
    
    [self.animator addBehavior:gravity];
}

@end

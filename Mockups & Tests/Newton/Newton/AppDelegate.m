//
//  AppDelegate.m
//  Newton
//
//  Created by Nathan Trapp on 6/28/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "AppDelegate.h"
#import "GravityViewController.h"

@interface AppDelegate () <NSTableViewDelegate>

@property (strong) IBOutlet NSMutableArray *items;
@property (weak) IBOutlet PHYView *physicsView;
@property (strong) NSViewController *viewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self willChangeValueForKey:@"items"];
    self.items = [NSMutableArray arrayWithArray:@[
     @{@"items": @"Gravity"},
     @{@"items": @"Collision + Gravity"},
     @{@"items": @"Attachments"},
     @{@"items": @"Collision + Gravity + Spring"},
     @{@"items": @"Snap"},
     @{@"items": @"Instantaneous Push"},
     @{@"items": @"Continuous Push"},
     @{@"items": @"Item Properties"}]];
    [self didChangeValueForKey:@"items"];

    

}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSTableView *table = [notification object];

    NSInteger selectedRow = [table selectedRow];

    NSString *label = [[self.items objectAtIndex: selectedRow] objectForKey: @"items"];

    [self.viewController.view removeFromSuperview];

    self.viewController = nil;

    self.viewController = [[NSClassFromString([NSString stringWithFormat:@"%@ViewController",label]) alloc] initWithNibName:label bundle:nil];

    [self.physicsView addSubview: self.viewController.view];
}

@end

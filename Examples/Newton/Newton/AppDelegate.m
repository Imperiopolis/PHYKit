//
//  AppDelegate.m
//  Newton
//
//  Created by Nora Trapp on 6/28/13.
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
    
    // Strip spaces and pluses
    NSCharacterSet *charactersToRemove = [NSCharacterSet characterSetWithCharactersInString:@" +"];
    NSString *classPrefix = [[label componentsSeparatedByCharactersInSet:charactersToRemove] componentsJoinedByString:@""];

    [self.viewController.view removeFromSuperview];

    self.viewController = nil;

    NSString *className = [classPrefix stringByAppendingString:@"ViewController"];
    NSString *nibName = [classPrefix stringByAppendingString:@"View"];
    
    self.viewController = [[NSClassFromString(className) alloc] initWithNibName:nibName bundle:nil];

    [self.physicsView addSubview: self.viewController.view];
}

@end

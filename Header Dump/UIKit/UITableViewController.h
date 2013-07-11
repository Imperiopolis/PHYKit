//
//  UITableViewController.h
//  UIKit
//
//  Copyright (c) 2008-2013, Apple Inc. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
#import <UIKit/UITableView.h>
#import <UIKit/UIKitDefines.h>

// Creates a table view with the correct dimensions and autoresizing, setting the datasource and delegate to self.
// In -viewWillAppear:, it reloads the table's data if it's empty. Otherwise, it deselects all rows (with or without animation) if clearsSelectionOnViewWillAppear is YES.
// In -viewDidAppear:, it flashes the table's scroll indicators.
// Implements -setEditing:animated: to toggle the editing state of the table.

NS_CLASS_AVAILABLE_IOS(2_0) @interface UITableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (id)initWithStyle:(UITableViewStyle)style;

@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic) BOOL clearsSelectionOnViewWillAppear NS_AVAILABLE_IOS(3_2); // defaults to YES. If YES, any selection is cleared in viewWillAppear:

@property (nonatomic,retain) UIRefreshControl *refreshControl NS_AVAILABLE_IOS(6_0);

@end

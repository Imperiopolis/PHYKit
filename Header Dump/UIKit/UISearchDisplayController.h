//
//  UISearchDisplayController.h
//  UIKit
//
//  Copyright (c) 2009-2013, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UILabel.h>
#import <UIKit/UITableView.h>

@class UISearchBar, UITableView, UIViewController, UIPopoverController;
@protocol UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate;

NS_CLASS_AVAILABLE_IOS(3_0) @interface UISearchDisplayController : NSObject

- (id)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController;

@property(nonatomic,assign)                           id<UISearchDisplayDelegate> delegate;

@property(nonatomic,getter=isActive)  BOOL            active;  // configure the view controller for searching. default is NO. animated is NO
- (void)setActive:(BOOL)visible animated:(BOOL)animated;       // animate the view controller for searching

@property(nonatomic,readonly)                         UISearchBar                *searchBar;
@property(nonatomic,readonly)                         UIViewController           *searchContentsController; // the view we are searching (often a UITableViewController)
@property(nonatomic,readonly)                         UITableView                *searchResultsTableView;   // will return non-nil. create if requested
@property(nonatomic,assign)                           id<UITableViewDataSource>   searchResultsDataSource;  // default is nil. delegate can provide
@property(nonatomic,assign)                           id<UITableViewDelegate>     searchResultsDelegate;    // default is nil. delegate can provide
@property(nonatomic,copy)                             NSString                   *searchResultsTitle NS_AVAILABLE_IOS(5_0); // default is nil. If nil, the controller uses the default title string

/* Displaying the search bar in a navigation bar will override the contentsController's navigationItem if it has one. */
@property (nonatomic, assign) BOOL displaysSearchBarInNavigationBar NS_AVAILABLE_IOS(7_0);
@property (nonatomic, readonly) UINavigationItem *navigationItem NS_AVAILABLE_IOS(7_0);

@end

@protocol UISearchDisplayDelegate <NSObject>

@optional

// when we start/end showing the search UI
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller;
- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller;
- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller;
- (void) searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller;

// called when the table is created destroyed, shown or hidden. configure as necessary.
- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView;
- (void)searchDisplayController:(UISearchDisplayController *)controller willUnloadSearchResultsTableView:(UITableView *)tableView;

// called when table is shown/hidden
- (void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView;
- (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView;
- (void)searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView;
- (void)searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView;

// return YES to reload table. called when search string/option changes. convenience methods on top UISearchBar delegate methods
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString;
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption;

@end

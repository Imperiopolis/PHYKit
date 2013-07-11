//
//  UIDocumentInteractionController.h
//  UIKit
//
//  Copyright (c) 2009-2013, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIActivityViewController.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIViewController.h>

@protocol UIDocumentInteractionControllerDelegate;

@class UIImage, UIView, UIPopoverController;

NS_CLASS_AVAILABLE_IOS(3_2) @interface UIDocumentInteractionController : NSObject <UIActionSheetDelegate>

+ (UIDocumentInteractionController *)interactionControllerWithURL:(NSURL *)url; // use file to determine UTI. assumes file is complete

@property(nonatomic,assign) id<UIDocumentInteractionControllerDelegate> delegate; // default is nil

@property(retain)   NSURL    *URL;             // default is nil. if set, updates UTI, icon and name
@property(nonatomic,copy)     NSString *UTI;             // determined from name if set, URL otherwise, override if the name or URL uses a custom scheme and the UTI can't be determined automatically
@property(copy)               NSString *name;            // determined from URL, override if the URL uses a custom scheme and the name can't be determined automatically
@property(nonatomic,readonly) NSArray  *icons;           // determined from name if set, URL otherwise. will return a generic document icon if an icon cannot be determined. returns an array of icons sorted from smallest to largest.
@property(nonatomic,retain)   id        annotation;      // additional plist information for application to pass to receiver (must be a plist object). default is nil.

// This is the default method you should call to give your users the option to quick look, open, or copy the document.
// Presents a menu allowing the user to Quick Look, open, or copy the item specified by URL.
// This automatically determines the correct application or applications that can open the item at URL.
// Returns NO if the options menu contained no options and was not opened.
// Note that you must implement the delegate method documentInteractionControllerViewControllerForPreview: to get the Quick Look menu item.
- (BOOL)presentOptionsMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;
- (BOOL)presentOptionsMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;

// Bypasses the menu and opens the full screen preview window for the item at URL.  Returns NO if the item could not be previewed.
// Note that you must implement the delegate method documentInteractionControllerViewControllerForPreview: to preview the document.
- (BOOL)presentPreviewAnimated:(BOOL)animated;

// Presents a menu allowing the user to open the document in another application.  The menu
// will contain all applications that can open the item at URL.
// Returns NO if there are no applications that can open the item at URL.
- (BOOL)presentOpenInMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated;
- (BOOL)presentOpenInMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;

// Dismiss the full screen quick look window if it is visible.
- (void)dismissPreviewAnimated:(BOOL)animated;

// Dismiss any visible menus.
- (void)dismissMenuAnimated:(BOOL)animated;

// Returns an array of gesture recognizers preconfigured to manage the quick look and options menu.
// These gesture recognizers should only be installed on your view when the file has been copied locally and is present at URL.
@property(nonatomic,readonly) NSArray *gestureRecognizers;

@end

@protocol UIDocumentInteractionControllerDelegate <NSObject>

@optional

// If preview is supported, this provides the view controller on which the preview will be presented.
// This method is required if preview is supported.
// If presenting atop a navigation stack, provide the navigation controller in order to animate in a manner consistent with the rest of the platform.
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller;

// If preview is supported, these provide the view and rect that will be used as the starting point for the animation to the full screen preview.
// The actual animation that is performed depends upon the platform and other factors.
// If documentInteractionControllerRectForPreview is not implemented, the specified view's bounds will be used.
// If documentInteractionControllerViewForPreview is not implemented, the preview controller will simply fade in instead of scaling up.
- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller;
- (UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller;

// Preview presented/dismissed on document.  Use to set up any HI underneath.
- (void)documentInteractionControllerWillBeginPreview:(UIDocumentInteractionController *)controller;
- (void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller;

// Options menu presented/dismissed on document.  Use to set up any HI underneath.
- (void)documentInteractionControllerWillPresentOptionsMenu:(UIDocumentInteractionController *)controller;
- (void)documentInteractionControllerDidDismissOptionsMenu:(UIDocumentInteractionController *)controller;

// Open in menu presented/dismissed on document.  Use to set up any HI underneath.
- (void)documentInteractionControllerWillPresentOpenInMenu:(UIDocumentInteractionController *)controller;
- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller;

// Synchronous.  May be called when inside preview.  Usually followed by app termination.  Can use willBegin... to set annotation.
- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(NSString *)application;	 // bundle ID
- (void)documentInteractionController:(UIDocumentInteractionController *)controller didEndSendingToApplication:(NSString *)application;

// Used to handle additional menu items that can be performed on the item specified by URL.  Currently only supports the "copy:", "print:" and "saveToCameraRoll:" actions.
- (BOOL)documentInteractionController:(UIDocumentInteractionController *)controller canPerformAction:(SEL)action NS_DEPRECATED_IOS(3_2, 6_0);
- (BOOL)documentInteractionController:(UIDocumentInteractionController *)controller performAction:(SEL)action NS_DEPRECATED_IOS(3_2, 6_0);

@end 

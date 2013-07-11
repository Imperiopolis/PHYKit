/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIViewController.h>

WebUIBrowserLoadingControllerDelegate.h_UIServiceWebViewControllerProtocol.h
@class WebUIBrowserLoadingController, _UIServiceWebView;

__attribute__((visibility("hidden")))
@interface _UIServiceWebViewController : UIViewController <_UIServiceWebViewControllerProtocol, WebUIBrowserLoadingControllerDelegate>
{
    _UIServiceWebView *_uiWebView;
    WebUIBrowserLoadingController *_loadingController;
}

+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)didRotateFromInterfaceOrientation:(int)arg1;
- (void)willRotateToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (void)stopLoading;
- (void)reload;
- (void)goForward;
- (void)goBack;
- (void)loadUserTypedAddress:(id)arg1;
- (void)loadHTMLString:(id)arg1 baseURL:(id)arg2;
- (void)loadEncodedRequest:(id)arg1;
- (void)browserLoadingControllerDidUpdateURLString:(id)arg1;
- (void)browserLoadingControllerDidUpdateTitle:(id)arg1;
- (void)browserLoadingControllerDidUpdateBackForward:(id)arg1;
- (void)browserLoadingController:(id)arg1 didFinishLoadingWithError:(id)arg2 dataSource:(id)arg3;
- (void)browserLoadingControllerDidStartLoading:(id)arg1;
- (void)browserLoadingControllerDidUpdateEstimatedProgress:(id)arg1;
- (void)dealloc;
- (void)loadView;
- (id)_makeAlertView;
- (void)_webContentSizeWithReplyHandler:(id)arg1;
- (void)configureWithEncodedSettings:(id)arg1;
- (void)_remotelyDispatchDidDismissViewController;
- (void)_remotelyDispatchWillPresentViewControllerWithCompletionHandler:(id)arg1;
- (void)_remotelyDecidePolicyForRequest:(id)arg1 inMainFrame:(BOOL)arg2 navigationType:(id)arg3 decisionHandler:(id)arg4;
- (void)setShouldDecidePolicyRemotely:(BOOL)arg1;
- (void)_willAppearInRemoteViewController;
- (void)_setupRemoteInspectorDetailsForRequestingProcess;
- (id)localizedApplicationNameForProcess:(int)arg1;
- (BOOL)_isInternalInstall;
- (id)initWithNibName:(id)arg1 bundle:(id)arg2;

@end


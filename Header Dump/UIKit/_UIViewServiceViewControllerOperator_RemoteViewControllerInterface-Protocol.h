/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

_UIViewServiceDeputy_UIViewServiceInterface.h_UIViewServiceUIBehaviorInterface.h
@protocol _UIViewServiceViewControllerOperator_RemoteViewControllerInterface <_UIViewServiceDeputy_UIViewServiceInterface, _UIViewServiceUIBehaviorInterface>
- (void)__restoreStateForSession:(id)arg1 restorationAnchor:(id)arg2;
- (void)__saveStateForSession:(id)arg1 restorationAnchor:(id)arg2 completionHandler:(id)arg3;
- (void)__dimmingViewWasTapped;
- (void)__textServiceDidDismiss;
- (void)__setHostTintColor:(id)arg1 tintAdjustmentMode:(int)arg2;
- (void)__hostDidUpdateAppearanceWithSerializedRepresentations:(id)arg1 originalSource:(id)arg2 legacyAppearance:(BOOL)arg3;
- (void)__scrollToTopFromTouchAtViewLocation:(id)arg1 resultHandler:(id)arg2;
- (void)__hostedActionSheetDidDismissWithClickedButtonIndex:(int)arg1;
- (void)__hostedActionSheetClickedButtonAtIndex:(int)arg1;
- (void)__hostedActionSheetDidPresent;
- (void)__hostDidPromoteFirstResponder;
- (void)__hostDidRotateFromInterfaceOrientation:(int)arg1 skipSelf:(BOOL)arg2;
- (void)__hostWillAnimateRotationToInterfaceOrientation:(int)arg1 duration:(double)arg2 skipSelf:(BOOL)arg3;
- (void)__hostWillRotateToInterfaceOrientation:(int)arg1 duration:(double)arg2 skipSelf:(BOOL)arg3;
- (void)__hostDidChangeStatusBarHeight:(float)arg1;
- (void)__hostDidChangeStatusBarOrientationToInterfaceOrientation:(int)arg1;
- (void)__hostDidEnterBackground;
- (void)__hostWillEnterForeground;
- (void)__setContentSize:(id)arg1;
- (void)__setServiceInPopover:(BOOL)arg1;
- (void)__hostViewDidMoveToScreenWithIntegerDisplayID:(unsigned int)arg1 contextReplyPort:(id)arg2;
- (void)__hostViewDidDisappear:(BOOL)arg1;
- (void)__hostViewWillDisappear:(BOOL)arg1;
- (void)__hostViewDidAppear:(BOOL)arg1;
- (void)__hostViewWillAppear:(BOOL)arg1 inInterfaceOrientation:(int)arg2 statusBarHeight:(float)arg3 completionHandler:(id)arg4;
- (void)__hostReadyToReceiveMessagesFromServiceViewController;
- (void)__createViewController:(id)arg1 withAppearanceSerializedRepresentations:(id)arg2 legacyAppearance:(BOOL)arg3 hostAccessibilityServerPort:(id)arg4 canShowTextServices:(BOOL)arg5 replyHandler:(id)arg6;
@end


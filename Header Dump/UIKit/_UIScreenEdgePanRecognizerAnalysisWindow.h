/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIWindow.h>

@class NSMutableArray, UIDelayedAction, UIView, _UIScreenEdgePanRecognizer;

__attribute__((visibility("hidden")))
@interface _UIScreenEdgePanRecognizerAnalysisWindow : UIWindow
{
    NSMutableArray *_failureMessageLabels;
    UIDelayedAction *_messageFadeAction;
    UIView *_backgroundView;
    _UIScreenEdgePanRecognizer *_recognizer;
    long _maximumVisibleOverlayItems;
}

@property(nonatomic) long maximumVisibleOverlayItems; // @synthesize maximumVisibleOverlayItems=_maximumVisibleOverlayItems;
@property(nonatomic) _UIScreenEdgePanRecognizer *recognizer; // @synthesize recognizer=_recognizer;
- (id)hitTest:(struct CGPoint)arg1 withEvent:(id)arg2;
- (void)layoutSubviews;
- (void)dismissMessages;
- (void)fadeOldestMessage;
- (void)pushStatusMessage:(id)arg1 toVisualOverlay:(BOOL)arg2;
- (void)pushFailureMessage:(id)arg1 toVisualOverlay:(BOOL)arg2;
- (void)pushMessage:(id)arg1 toVisualOverlay:(BOOL)arg2;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1;
- (BOOL)_isWindowServerHostingManaged;

@end


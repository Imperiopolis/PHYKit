/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIView.h>

_UIScrollToTopView.h
@class _UIRemoteViewController;

__attribute__((visibility("hidden")))
@interface _UISizeTrackingView : UIView <_UIScrollToTopView>
{
    _UIRemoteViewController *_remoteViewController;
    id _viewControllerOperatorProxy;
    id _textEffectsOperatorProxy;
}

+ (id)viewWithRemoteViewController:(id)arg1 viewControllerOperatorProxy:(id)arg2 textEffectsOperatorProxy:(id)arg3;
- (void)_didMoveFromWindow:(id)arg1 toWindow:(id)arg2;
- (void)_scrollToTopFromTouchAtScreenLocation:(struct CGPoint)arg1 resultHandler:(id)arg2;
- (BOOL)isScrollEnabled;
- (void)setBounds:(struct CGRect)arg1;
- (void)setFrame:(struct CGRect)arg1;
- (void)_updateTextEffectsGeometries;

@end


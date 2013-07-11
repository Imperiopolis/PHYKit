/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@protocol UIViewControllerTransitionCoordinatorContext <NSObject>
- (id)containerView;
- (id)viewControllerForKey:(id)arg1;
- (int)completionCurve;
- (float)completionVelocity;
- (float)percentComplete;
- (double)transitionDuration;
- (BOOL)isCancelled;
- (BOOL)isInteractive;
- (BOOL)initiallyInteractive;
- (int)presentationStyle;
- (BOOL)isAnimated;
@end

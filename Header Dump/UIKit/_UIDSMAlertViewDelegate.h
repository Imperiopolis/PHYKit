/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
UIAlertViewDelegate.h
__attribute__((visibility("hidden")))
@interface _UIDSMAlertViewDelegate : NSObject <UIAlertViewDelegate>
{
    id _completionHandler;
}

@property(copy) id completionHandler; // @synthesize completionHandler=_completionHandler;
- (void)alertView:(id)arg1 didDismissWithButtonIndex:(int)arg2;
- (void)willPresentAlertView:(id)arg1;

@end


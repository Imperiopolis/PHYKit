/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIStatusBarItemView.h>

__attribute__((visibility("hidden")))
@interface UIStatusBarBluetoothItemView : UIStatusBarItemView
{
    BOOL _connected;
    BOOL _shouldAnimateConnection;
}

- (float)alphaForConnected:(BOOL)arg1;
- (void)setVisible:(BOOL)arg1;
- (id)contentsImage;
- (void)performPendedActions;
- (BOOL)updateForNewData:(id)arg1 actions:(int)arg2;

@end

/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UITableView.h>

@class UIKeyboardMenuView;

__attribute__((visibility("hidden")))
@interface UIInputSwitcherTableView : UITableView
{
    UIKeyboardMenuView *_menu;
}

@property(nonatomic) UIKeyboardMenuView *menu; // @synthesize menu=_menu;
- (void)selectRowAtIndexPath:(id)arg1 animated:(BOOL)arg2 scrollPosition:(int)arg3;
- (void)deselectRowAtIndexPath:(id)arg1 animated:(BOOL)arg2;

@end


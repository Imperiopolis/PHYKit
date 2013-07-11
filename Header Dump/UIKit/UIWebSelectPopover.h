/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIWebRotatingAccessoryPopover.h>

UIWebFormControl.h
@class UIKeyboard, UIWebSelectTableViewController;

__attribute__((visibility("hidden")))
@interface UIWebSelectPopover : UIWebRotatingAccessoryPopover <UIWebFormControl>
{
    UIWebSelectTableViewController *_tableViewController;
    UIKeyboard *_keyboard;
}

@property(retain, nonatomic) UIWebSelectTableViewController *_tableViewController; // @synthesize _tableViewController;
- (void)_userActionDismissedPopover:(id)arg1;
- (void)controlBeginEditing;
- (id)controlView;
- (void)dealloc;
- (id)initWithDOMHTMLSelectElement:(id)arg1 cachedItems:(id)arg2 singleSelectionItem:(id)arg3 singleSelectionIndex:(unsigned int)arg4 multipleSelection:(BOOL)arg5;

@end


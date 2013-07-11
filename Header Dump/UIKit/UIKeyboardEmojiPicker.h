/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIKBKeyView.h>

#import <UIKit/UITableViewDataSource.h> 
UITableViewDelegate.h
@class UIImageView, UITableView;

__attribute__((visibility("hidden")))
@interface UIKeyboardEmojiPicker : UIKBKeyView <UITableViewDelegate, UITableViewDataSource>
{
    UIImageView *_container;
    UITableView *_picker;
    UIImageView *_innerShadow;
}

@property(readonly) UITableView *picker; // @synthesize picker=_picker;
- (float)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (BOOL)shouldCache;
- (void)dealloc;
- (id)container;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)containerView;
- (id)defaultIndexPath;

@end


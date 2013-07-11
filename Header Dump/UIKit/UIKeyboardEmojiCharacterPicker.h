/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIKeyboardEmojiPicker.h>

UIKeyboardEmojiInput.h
@class UIKeyboardEmojiCategory, UIKeyboardEmojiInputController;

__attribute__((visibility("hidden")))
@interface UIKeyboardEmojiCharacterPicker : UIKeyboardEmojiPicker <UIKeyboardEmojiInput>
{
    UIKeyboardEmojiCategory *_category;
    UIKeyboardEmojiInputController *_inputController;
}

@property UIKeyboardEmojiCategory *category; // @synthesize category=_category;
- (void)scrollViewWillEndDragging:(id)arg1 withVelocity:(struct CGPoint)arg2 targetContentOffset:(inout struct CGPoint *)arg3;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (id)charactersForRow:(int)arg1;
- (void)reloadForCategory:(id)arg1;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1 keyplane:(id)arg2 key:(id)arg3;

@end


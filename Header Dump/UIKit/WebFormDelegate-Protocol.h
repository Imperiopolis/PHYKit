/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@protocol WebFormDelegate <NSObject>
- (void)willSendSubmitEventToForm:(id)arg1 inFrame:(id)arg2 withValues:(id)arg3;
- (void)frame:(id)arg1 sourceFrame:(id)arg2 willSubmitForm:(id)arg3 withValues:(id)arg4 submissionListener:(id)arg5;
- (BOOL)textField:(id)arg1 doCommandBySelector:(SEL)arg2 inFrame:(id)arg3;
- (void)didFocusTextField:(id)arg1 inFrame:(id)arg2;
- (void)textDidChangeInTextArea:(id)arg1 inFrame:(id)arg2;
- (void)textDidChangeInTextField:(id)arg1 inFrame:(id)arg2;
- (void)textFieldDidEndEditing:(id)arg1 inFrame:(id)arg2;
- (void)textFieldDidBeginEditing:(id)arg1 inFrame:(id)arg2;
@end


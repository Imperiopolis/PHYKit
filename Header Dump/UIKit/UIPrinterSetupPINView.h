/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIControl.h>

UITextFieldDelegate.h
@class UIImageView, UILabel, UIPasscodeField, UITextField;

__attribute__((visibility("hidden")))
@interface UIPrinterSetupPINView : UIControl <UITextFieldDelegate>
{
    UILabel *_titleLabel;
    UILabel *_enterLabel;
    UIPasscodeField *_passcodeField;
    UITextField *_textEntryField;
    UILabel *_failedLabel;
    UIImageView *_failedBackground;
    int _failedAttemptCount;
}

@property(nonatomic) int failedAttemptCount; // @synthesize failedAttemptCount=_failedAttemptCount;
@property(retain, nonatomic) UIImageView *failedBackground; // @synthesize failedBackground=_failedBackground;
@property(retain, nonatomic) UILabel *failedLabel; // @synthesize failedLabel=_failedLabel;
@property(retain, nonatomic) UITextField *textEntryField; // @synthesize textEntryField=_textEntryField;
@property(retain, nonatomic) UIPasscodeField *passcodeField; // @synthesize passcodeField=_passcodeField;
@property(retain, nonatomic) UILabel *enterLabel; // @synthesize enterLabel=_enterLabel;
@property(retain, nonatomic) UILabel *titleLabel; // @synthesize titleLabel=_titleLabel;
- (void)textDidChange:(id)arg1;
- (void)showSuccess:(BOOL)arg1;
- (id)PIN;
- (void)stopPINInput;
- (void)startPINInput;
- (void)layoutSubviews;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (void)dealloc;
- (id)initWithPrinterName:(id)arg1;

@end


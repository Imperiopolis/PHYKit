/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/_UITextViewInteractableItem.h>

@class NSTextAttachment;

__attribute__((visibility("hidden")))
@interface _UITextViewInteractableAttachment : _UITextViewInteractableItem
{
    NSTextAttachment *_attachment;
}

+ (id)interactableLinkWithAttachment:(id)arg1 range:(struct _NSRange)arg2;
@property(retain, nonatomic) NSTextAttachment *attachment; // @synthesize attachment=_attachment;
- (void)_saveToCameraRoll;
- (void)_copyImage;
- (id)defaultAction;
- (id)actions;
- (BOOL)allowInteraction;
- (id)_image;
- (id)localizedTitle;
- (void)dealloc;

@end


/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@interface UITableViewCellLayoutManager : NSObject
{
}

+ (id)layoutManagerForTableViewCellStyle:(int)arg1;
- (struct CGRect)textRectForCell:(id)arg1;
- (struct CGRect)contentEndingRectForCell:(id)arg1 forDisplayOfDeleteConfirmation:(BOOL)arg2;
- (struct CGRect)contentStartingRectForCell:(id)arg1 forDisplayOfDeleteConfirmation:(BOOL)arg2;
- (struct CGRect)contentEndingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (struct CGRect)contentStartingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (struct CGRect)selectedBackgroundEndingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (struct CGRect)backgroundEndingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (struct CGRect)backgroundStartingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (struct CGRect)deleteConfirmationRectForCell:(id)arg1;
- (BOOL)editingAccessoryShouldFadeForCell:(id)arg1;
- (struct CGRect)editingAccessoryEndingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2 showingDeleteConfirmation:(BOOL)arg3;
- (struct CGRect)editingAccessoryStartingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2 showingDeleteConfirmation:(BOOL)arg3;
- (BOOL)editingAccessoryShouldAppearForCell:(id)arg1;
- (BOOL)accessoryShouldFadeForCell:(id)arg1;
- (struct CGRect)accessoryEndingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2 showingDeleteConfirmation:(BOOL)arg3;
- (struct CGRect)accessoryStartingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2 showingDeleteConfirmation:(BOOL)arg3;
- (BOOL)accessoryShouldAppearForCell:(id)arg1;
- (BOOL)reorderSeparatorShouldFadeForCell:(id)arg1;
- (struct CGRect)reorderSeparatorEndingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (struct CGRect)reorderSeparatorStartingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (BOOL)reorderSeparatorShouldAppearForCell:(id)arg1;
- (BOOL)reorderControlShouldFadeForCell:(id)arg1;
- (struct CGRect)reorderControlEndingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (struct CGRect)reorderControlStartingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (BOOL)reorderControlShouldAppearForCell:(id)arg1;
- (BOOL)editControlShouldFadeForCell:(id)arg1;
- (struct CGRect)editControlEndingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (struct CGRect)editControlStartingRectForCell:(id)arg1 forNewEditingState:(BOOL)arg2;
- (BOOL)editControlShouldAppearForCell:(id)arg1;
- (struct CGRect)contentRectForCell:(id)arg1 forState:(unsigned int)arg2;
- (void)cell:(id)arg1 didTransitionToState:(unsigned int)arg2;
- (void)cell:(id)arg1 willTransitionToState:(unsigned int)arg2;
- (void)layoutSubviewsOfCell:(id)arg1;
- (float)contentIndentationForCell:(id)arg1;
- (id)badgeForCell:(id)arg1;
- (id)editableTextFieldForCell:(id)arg1;
- (id)detailTextLabelForCell:(id)arg1;
- (id)textLabelForCell:(id)arg1;
- (id)imageViewForCell:(id)arg1;
- (id)defaultBadgeForCell:(id)arg1;
- (id)defaultEditableTextFieldForCell:(id)arg1;
- (id)defaultLabelForCell:(id)arg1;
- (id)defaultLabelForCell:(id)arg1 ofClass:(Class)arg2;
- (id)defaultTextLabelFontForCell:(id)arg1;
- (id)defaultImageViewForCell:(id)arg1;
- (float)defaultDetailTextLabelFontSizeForCell:(id)arg1;
- (float)defaultTextLabelFontSizeForCell:(id)arg1;
- (struct CGRect)_contentRectForCell:(id)arg1 forEditingState:(BOOL)arg2 showingDeleteConfirmation:(BOOL)arg3;
- (struct CGRect)_editingAccessoryRectForCell:(id)arg1 offscreen:(BOOL)arg2;
- (struct CGRect)_accessoryRectForCell:(id)arg1 offscreen:(BOOL)arg2;
- (struct CGRect)_reorderSeparatorRectForCell:(id)arg1 offscreen:(BOOL)arg2;
- (struct CGRect)_reorderControlRectForCell:(id)arg1 offscreen:(BOOL)arg2;
- (struct CGRect)_editControlRectForCell:(id)arg1 offscreen:(BOOL)arg2;
- (struct CGRect)_adjustedBackgroundContentRectForCell:(id)arg1 forIndentedState:(BOOL)arg2;
- (struct CGRect)_adjustedBackgroundRectForCell:(id)arg1 forIndentedState:(BOOL)arg2;
- (struct CGRect)_backgroundRectForCell:(id)arg1 forIndentedState:(BOOL)arg2;

@end


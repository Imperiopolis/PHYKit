/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIPickerView.h>

UIPickerViewDataSource.hUIPickerViewDelegate.hUIWebFormControl.h
@class DOMHTMLSelectElement, NSArray;

__attribute__((visibility("hidden")))
@interface UIWebSelectPicker : UIPickerView <UIWebFormControl, UIPickerViewDataSource, UIPickerViewDelegate>
{
    DOMHTMLSelectElement *_selectionNode;
    NSArray *_cachedItems;
    id <UIWebSelectedItemPrivate> _singleSelectionItem;
    unsigned int _singleSelectionIndex;
    float _fontSize;
    float _maximumTextWidth;
    int _textAlignment;
    float _layoutWidth;
}

@property(retain, nonatomic) id <UIWebSelectedItemPrivate> _singleSelectionItem; // @synthesize _singleSelectionItem;
@property(retain, nonatomic) NSArray *_cachedItems; // @synthesize _cachedItems;
@property(retain, nonatomic) DOMHTMLSelectElement *_selectionNode; // @synthesize _selectionNode;
- (void)pickerView:(id)arg1 row:(int)arg2 column:(int)arg3 checked:(BOOL)arg4;
- (int)_itemIndexForRowIndex:(int)arg1;
- (int)pickerView:(id)arg1 numberOfRowsInComponent:(int)arg2;
- (int)numberOfComponentsInPickerView:(id)arg1;
- (id)pickerView:(id)arg1 viewForRow:(int)arg2 forComponent:(int)arg3 reusingView:(id)arg4;
- (void)layoutSubviews;
- (void)controlBeginEditing;
- (id)controlView;
- (void)dealloc;
- (id)initWithDOMHTMLSelectElement:(id)arg1 cachedItems:(id)arg2 singleSelectionItem:(id)arg3 singleSelectionIndex:(unsigned int)arg4 multipleSelection:(BOOL)arg5;

@end


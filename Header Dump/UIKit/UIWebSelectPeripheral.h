/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
UIFormPeripheral.h
@class DOMHTMLSelectElement;

__attribute__((visibility("hidden")))
@interface UIWebSelectPeripheral : NSObject <UIFormPeripheral>
{
    DOMHTMLSelectElement *_selectionNode;
    id <UIWebFormControl> _selectControl;
}

+ (id)createPeripheralWithDOMHTMLSelectElement:(id)arg1;
@property(retain, nonatomic) id <UIWebFormControl> _selectControl; // @synthesize _selectControl;
@property(retain, nonatomic) DOMHTMLSelectElement *_selectionNode; // @synthesize _selectionNode;
- (void)beginEditing;
- (id)assistantView;
- (void)dealloc;
- (id)initWithDOMHTMLSelectElement:(id)arg1;

@end

/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@class UIControl, UIRemoveControl, UIView;

__attribute__((visibility("hidden")))
@interface _UITableViewCellOldEditingData : NSObject
{
    UIRemoveControl *_removeControl;
    UIControl *_grabber;
    UIView *_separator;
}

@property(retain, nonatomic) UIView *separatorView; // @synthesize separatorView=_separator;
@property(retain, nonatomic) UIControl *reorderControl; // @synthesize reorderControl=_grabber;
- (void)dealloc;
- (BOOL)dataRequired;

@end


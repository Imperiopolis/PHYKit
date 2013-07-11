/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIViewPrintFormatter.h>

@class UIWebPaginationInfo;

@interface UIWebDocumentViewPrintFormatter : UIViewPrintFormatter
{
    UIWebPaginationInfo *_paginationInfo;
}

- (void)drawInRect:(struct CGRect)arg1 forPageAtIndex:(int)arg2;
- (struct CGRect)rectForPageAtIndex:(int)arg1;
- (int)_recalcPageCount;
- (void)removeFromPrintPageRenderer;
- (id)_webDocumentView;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)dealloc;

@end


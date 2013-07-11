/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
UIWebFindOnPageHighlighter.h
@class NSArray, NSMutableArray, NSString, UIView, UIWebBrowserView, UIWebPDFViewHandler;

__attribute__((visibility("hidden")))
@interface UIWebBrowserFindOnPageHighlighter : NSObject <UIWebFindOnPageHighlighter>
{
    NSMutableArray *_highlightBubbleViews;
    NSArray *_pdfHighlightViews;
    UIView *_highlightHostView;
    UIWebBrowserView *_browserView;
    UIWebPDFViewHandler *_pdfHandler;
    BOOL _zoomToHighlightSelection;
    id <UIWebFindOnPageHighlighterDelegate> _delegate;
    NSString *_searchText;
    unsigned int _numberOfMatches;
    unsigned int _highlightedMatchIndex;
}

+ (BOOL)expandedRectsWouldIntersect:(id)arg1;
@property(readonly, nonatomic) unsigned int highlightedMatchIndex; // @synthesize highlightedMatchIndex=_highlightedMatchIndex;
@property(readonly, nonatomic) unsigned int numberOfMatches; // @synthesize numberOfMatches=_numberOfMatches;
@property(nonatomic) id <UIWebFindOnPageHighlighterDelegate> delegate; // @synthesize delegate=_delegate;
@property(readonly, nonatomic) NSString *searchText; // @synthesize searchText=_searchText;
- (void)search:(id)arg1 hasPartialResults:(id)arg2;
- (void)searchDidFinish:(id)arg1;
- (void)searchLimitHit:(id)arg1;
- (void)searchWasCancelled:(id)arg1;
- (void)searchDidTimeOut:(id)arg1;
- (void)searchDidBegin:(id)arg1;
- (void)highlightPreviousMatch;
- (void)highlightNextMatch;
- (void)_highlightFindOnPageMatch:(BOOL)arg1;
- (void)_highlightFindOnPageMatchForPDF:(BOOL)arg1 withPDFHandler:(id)arg2;
- (id)_currentPDFSearchResult;
- (BOOL)_updateHighlightedMatchIndex:(BOOL)arg1;
- (void)setSearchText:(id)arg1 matchLimit:(unsigned int)arg2;
- (unsigned int)findOnPageOptions;
- (BOOL)_highlightSelection;
- (BOOL)updateHighlightBubbleWobble:(BOOL)arg1;
- (void)setSelectionRect:(struct CGRect)arg1 textRects:(id)arg2 contentViews:(id)arg3 wobble:(BOOL)arg4;
- (void)setSelectionRect:(struct CGRect)arg1 textRects:(id)arg2 contentImage:(struct CGImage *)arg3 wobble:(BOOL)arg4;
- (void)_setSelectionRect:(struct CGRect)arg1 textRects:(id)arg2 contentImage:(struct CGImage *)arg3 contentViews:(id)arg4 wobble:(BOOL)arg5;
- (void)_clearHighlightViews;
- (void)_addContentViewAtIndex:(unsigned int)arg1 withRect:(struct CGRect)arg2;
- (void)clearBrowserView;
- (void)dealloc;
- (void)_commonInitialize;
- (id)initWithPDFViewHandler:(id)arg1;
- (id)initWithBrowserView:(id)arg1;

@end


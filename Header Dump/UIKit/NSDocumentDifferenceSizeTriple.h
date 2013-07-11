/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@class NSDocumentDifferenceSize;

__attribute__((visibility("hidden")))
@interface NSDocumentDifferenceSizeTriple : NSObject
{
    NSDocumentDifferenceSize *_dueToRecentChangesBeforeSaving;
    NSDocumentDifferenceSize *_betweenPreservingPreviousVersionAndSaving;
    NSDocumentDifferenceSize *_betweenPreviousSavingAndSaving;
}

@property(readonly, nonatomic) NSDocumentDifferenceSize *betweenPreviousSavingAndSaving; // @synthesize betweenPreviousSavingAndSaving=_betweenPreviousSavingAndSaving;
@property(readonly, nonatomic) NSDocumentDifferenceSize *betweenPreservingPreviousVersionAndSaving; // @synthesize betweenPreservingPreviousVersionAndSaving=_betweenPreservingPreviousVersionAndSaving;
@property(readonly, nonatomic) NSDocumentDifferenceSize *dueToRecentChangesBeforeSaving; // @synthesize dueToRecentChangesBeforeSaving=_dueToRecentChangesBeforeSaving;
- (id)description;
- (void)dealloc;
- (id)init;

@end


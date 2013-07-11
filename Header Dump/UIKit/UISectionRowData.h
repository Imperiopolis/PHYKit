/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
NSCopying.h
@class UITableViewRowData;

__attribute__((visibility("hidden")))
@interface UISectionRowData : NSObject <NSCopying>
{
    BOOL _valid;
    float _headerHeight;
    float _maxHeaderTitleWidth;
    float _footerHeight;
    float _maxFooterTitleWidth;
    float _headerOffset;
    float _footerOffset;
    unsigned int _numRows;
    unsigned int _arrayLength;
    float *_rowHeights;
    float *_rowOffsets;
    float _sectionHeight;
    int _headerAlignment;
    int _footerAlignment;
    UITableViewRowData *_rowData;
    BOOL _sectionOffsetValid;
    float _sectionOffset;
    int _sectionRowOffset;
}

- (id)copyWithZone:(struct _NSZone *)arg1;
- (int)rowForPoint:(struct CGPoint)arg1;
- (int)_rowForPoint:(struct CGPoint)arg1 beginningWithRow:(int)arg2 numberOfRows:(int)arg3;
- (int)sectionLocationForReorderedRow:(int)arg1;
- (int)sectionLocationForRow:(int)arg1;
- (float)offsetForRow:(int)arg1;
- (void)deleteRowAtIndex:(int)arg1;
- (void)insertRowAtIndex:(int)arg1 inSection:(int)arg2 rowHeight:(float)arg3 tableViewRowData:(id)arg4;
- (void)refreshWithSection:(int)arg1 tableView:(id)arg2 tableViewRowData:(id)arg3;
- (float)_defaultSectionFooterHeightForSection:(int)arg1 tableView:(id)arg2 tableViewRowData:(id)arg3;
- (float)_defaultSectionHeaderHeightForSection:(int)arg1 tableView:(id)arg2 tableViewRowData:(id)arg3;
- (float)heightForEmptySection:(int)arg1 inTableView:(id)arg2 rowData:(id)arg3;
- (float)heightForFooterInSection:(int)arg1 canGuess:(BOOL)arg2;
- (float)heightForHeaderInSection:(int)arg1 canGuess:(BOOL)arg2;
- (float)heightForRow:(int)arg1 inSection:(int)arg2 canGuess:(BOOL)arg3;
- (void)updateSectionHeightWithDelta:(float)arg1 updateFooterOffset:(BOOL)arg2;
- (void)setHeight:(float)arg1 forRow:(int)arg2;
- (void)addOffset:(float)arg1 fromRow:(int)arg2;
- (float)_headerOrFooterSizeForTable:(id)arg1 title:(id)arg2 detailText:(id)arg3 isHeader:(BOOL)arg4 stripPaddingForAbuttingView:(BOOL)arg5 isTopHeader:(BOOL)arg6;
- (void)invalidateSectionOffset;
- (void)invalidate;
- (void)dealloc;
- (id)initWithRowData:(id)arg1;

@end


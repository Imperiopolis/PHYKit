/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

UIKeyboardCandidateList.h
@protocol UIKeyboardCandidateGridCollectionViewControllerDelegate <UIKeyboardCandidateList>
- (unsigned int)gridCollectionViewNumberOfColumns:(id)arg1;
- (unsigned int)gridCollectionViewSelectedSortMethodIndex:(id)arg1;

@optional
- (void)scrollViewDidScroll:(id)arg1;
- (void)scrollViewWillBeginDragging:(id)arg1;
- (void)padInlineFloatingViewExpand:(id)arg1;
- (BOOL)padInlineFloatingViewIsExpanded:(id)arg1;
- (id)headerViewForCandidateSet:(id)arg1;
@end


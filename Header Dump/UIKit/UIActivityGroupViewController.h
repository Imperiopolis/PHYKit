/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UICollectionViewController.h>

UICollectionViewDelegateFlowLayout.h
@class NSArray, NSDictionary;

__attribute__((visibility("hidden")))
@interface UIActivityGroupViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>
{
    BOOL _hasActivities;
    int _activityCategory;
    NSArray *_activities;
    NSDictionary *_customActivityTitles;
}

@property(nonatomic) BOOL hasActivities; // @synthesize hasActivities=_hasActivities;
@property(copy, nonatomic) NSDictionary *customActivityTitles; // @synthesize customActivityTitles=_customActivityTitles;
@property(copy, nonatomic) NSArray *activities; // @synthesize activities=_activities;
@property(nonatomic) int activityCategory; // @synthesize activityCategory=_activityCategory;
- (struct UIEdgeInsets)collectionView:(id)arg1 layout:(id)arg2 insetForSectionAtIndex:(int)arg3;
- (struct CGSize)collectionView:(id)arg1 layout:(id)arg2 sizeForItemAtIndexPath:(id)arg3;
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2;
- (BOOL)collectionView:(id)arg1 shouldHighlightItemAtIndexPath:(id)arg2;
- (BOOL)collectionView:(id)arg1 shouldSelectItemAtIndexPath:(id)arg2;
- (id)collectionView:(id)arg1 cellForItemAtIndexPath:(id)arg2;
- (int)collectionView:(id)arg1 numberOfItemsInSection:(int)arg2;
- (void)willRotateToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (void)viewDidLoad;
- (void)dealloc;
- (id)initWithActivityCategory:(int)arg1 title:(id)arg2;

@end


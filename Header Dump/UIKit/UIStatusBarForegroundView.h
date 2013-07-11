/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIView.h>

@class NSMutableArray, UIStatusBarComposedData, UIStatusBarForegroundStyleAttributes, UIStatusBarLayoutManager;

__attribute__((visibility("hidden")))
@interface UIStatusBarForegroundView : UIView
{
    char _itemIsEnabled[31];
    UIStatusBarLayoutManager *_layoutManagers[3];
    int _ignoreDataLevel;
    NSMutableArray *_actionAnimationStack;
    UIStatusBarComposedData *_pendedData;
    int _pendedActions;
    int _idiom;
    UIStatusBarForegroundStyleAttributes *_foregroundStyle;
}

@property(readonly, nonatomic) UIStatusBarForegroundStyleAttributes *foregroundStyle; // @synthesize foregroundStyle=_foregroundStyle;
@property(nonatomic) int idiom; // @synthesize idiom=_idiom;
- (BOOL)pointInside:(struct CGPoint)arg1 withEvent:(id)arg2;
- (void)setBounds:(struct CGRect)arg1;
- (void)setFrame:(struct CGRect)arg1;
- (void)setPersistentAnimationsEnabled:(BOOL)arg1;
- (float)edgePadding;
- (BOOL)_tryToPlaceItem:(id)arg1 inItemArray:(id)arg2 layoutManager:(id)arg3 roomRemaining:(float *)arg4 allowSwap:(BOOL)arg5 swappedItem:(id *)arg6;
- (id)_computeVisibleItemsPreservingHistory:(BOOL)arg1;
- (void)_reflowItemViewsWithDuration:(double)arg1 preserveHistory:(BOOL)arg2;
- (void)_cleanUpAfterDataChange;
- (void)_cleanUpAfterSimpleReflow;
- (BOOL)ignoringData;
- (void)stopIgnoringData:(BOOL)arg1;
- (void)startIgnoringData;
- (void)reflowItemViewsForgettingEitherSideItemHistory;
- (void)reflowItemViews:(BOOL)arg1;
- (void)_reflowItemViewsCrossfadingCenterWithDuration:(double)arg1;
- (void)reflowItemViewsCrossfadingCenter:(id)arg1 duration:(double)arg2;
- (void)setStatusBarData:(id)arg1 actions:(int)arg2 animated:(BOOL)arg3;
- (void)_setStatusBarData:(id)arg1 actions:(int)arg2 animated:(BOOL)arg3;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1 foregroundStyle:(id)arg2;

@end


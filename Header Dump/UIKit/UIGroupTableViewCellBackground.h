/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIView.h>

@class UIColor;

__attribute__((visibility("hidden")))
@interface UIGroupTableViewCellBackground : UIView
{
    int _sectionLocation;
    int _newSectionLocation;
    int _animationCount;
    int _selectionStyle;
    int _separatorStyle;
    UIView *_topSeparatorView;
    UIView *_bottomSeparatorView;
    UIColor *_selectionTintColor;
    float _sectionBorderWidth;
    struct UIEdgeInsets _separatorInset;
    struct {
        unsigned int selected:1;
    } _groupBackgroundFlags;
}

+ (void)initialize;
+ (void)_flushCacheOnNotification:(id)arg1;
@property(nonatomic) struct UIEdgeInsets separatorInset; // @synthesize separatorInset=_separatorInset;
@property(nonatomic) float sectionBorderWidth; // @synthesize sectionBorderWidth=_sectionBorderWidth;
- (id)_topShadowViewWithColor:(id)arg1;
- (id)_contentMaskLayer;
- (void)layoutSubviews;
- (id)backgroundColor;
- (void)setBackgroundColor:(id)arg1;
@property(nonatomic, getter=isSelected) BOOL selected;
@property(nonatomic) int separatorStyle;
@property(nonatomic) int selectionStyle;
@property(retain, nonatomic) UIColor *selectionTintColor;
- (void)setSelectionTintColor:(id)arg1 layoutSubviews:(BOOL)arg2;
@property(nonatomic) int sectionLocation;
- (void)setSectionLocation:(int)arg1 animated:(BOOL)arg2;
- (void)_setSectionLocationAnimationDidStop;
- (void)setFrame:(struct CGRect)arg1;
- (void)displayLayer:(id)arg1;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1;
- (void)_layoutSubviews:(BOOL)arg1;
- (struct CGRect)_contentsCenter:(BOOL)arg1;
- (struct CGRect)_contentsRect:(BOOL)arg1;
- (float)_pixelDisplayedImageHeight;
- (void)_updateSeparatorViews;
- (id)_fillColor;
- (id)_bottomShadowColor;
- (id)_topShadowColor;
- (id)_separatorColor;
- (id)_sectionBorderColor;
- (id)_backgroundColor;
- (void)_decrementAnimationCount;
- (void)_incrementAnimationCount;
- (struct CGRect)_contentRectForContentHeight:(float)arg1;
- (id)_cachedImageForKey:(id)arg1;
- (id)_roundedRectBezierPathInRect:(struct CGRect)arg1 withSectionLocation:(int)arg2 forBorder:(BOOL)arg3 cornerRadiusAdjustment:(float)arg4;

@end

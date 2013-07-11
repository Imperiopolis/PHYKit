/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIControl.h>

@class NSValue, UIColor, UIImage, UITabBarButtonLabel, UITabBarSelectionIndicatorView, UIView, _UIBadgeView;

__attribute__((visibility("hidden")))
@interface UITabBarButton : UIControl
{
    struct CGRect _hitRect;
    UIView *_info;
    UITabBarButtonLabel *_label;
    _UIBadgeView *_badge;
    UITabBarSelectionIndicatorView *_selectedIndicator;
    BOOL _selected;
    BOOL _barHeight;
    BOOL _badgeAnimated;
    struct UIEdgeInsets _infoInsets;
    struct UIOffset _selectedInfoOffset;
    struct UIOffset _infoOffset;
    UIImage *_customSelectedIndicatorImage;
    NSValue *_labelOffsetValue;
    BOOL _selectedImageColoringIsStale;
    BOOL _centerAllContents;
    float _templateImageWidth;
    Class _appearanceGuideClass;
    UIColor *_unselectedTintColor;
}

+ (id)_defaultLabelColor;
+ (id)_defaultLabelFont;
@property(retain, nonatomic, getter=_unselectedTintColor, setter=_setUnselectedTintColor:) UIColor *unselectedTintColor; // @synthesize unselectedTintColor=_unselectedTintColor;
@property(nonatomic, setter=_setAppearanceGuideClass:) Class _appearanceGuideClass; // @synthesize _appearanceGuideClass;
@property(nonatomic, setter=_setCenterAllContents:) BOOL _centerAllContents; // @synthesize _centerAllContents;
@property(nonatomic, setter=_setSelectedImageColoringIsStale:) BOOL _selectedImageColoringIsStale; // @synthesize _selectedImageColoringIsStale;
@property(nonatomic, setter=_setTemplateImageWidth:) float _templateImageWidth; // @synthesize _templateImageWidth;
@property(readonly, nonatomic) UITabBarButtonLabel *tabBarButtonLabel; // @synthesize tabBarButtonLabel=_label;
@property(retain, nonatomic) NSValue *labelOffsetValue; // @synthesize labelOffsetValue=_labelOffsetValue;
- (void)_applyTabBarButtonAppearanceStorage:(id)arg1 withTaggedSelectors:(id)arg2;
- (struct UIOffset)_titlePositionAdjustment;
- (void)_setTitlePositionAdjustment:(struct UIOffset)arg1;
- (void)_UIAppearance_setTitlePositionAdjustment:(struct UIOffset)arg1;
- (void)_UIAppearance_setTitleTextAttributes:(id)arg1 forState:(unsigned int)arg2;
- (void)_setLabelHidden:(BOOL)arg1;
- (void)_setCustomSelectedIndicatorImage:(id)arg1;
- (BOOL)_useBarHeight;
- (void)_setBarHeight:(float)arg1;
- (void)layoutSubviews;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (struct CGRect)_frameForSelectedIndicator;
- (BOOL)pointInside:(struct CGPoint)arg1 withEvent:(id)arg2;
- (BOOL)pointInside:(struct CGPoint)arg1 forEvent:(struct __GSEvent *)arg2;
- (void)tintColorDidChange;
- (void)setEnabled:(BOOL)arg1;
- (void)_setBadgeAnimated:(BOOL)arg1;
- (void)_badgeAnimationDidStop:(id)arg1 finished:(id)arg2;
- (void)_setBadgeValue:(id)arg1;
- (void)setFrame:(struct CGRect)arg1;
- (void)_positionBadge;
- (void)_setInfoOffset:(struct UIOffset)arg1;
- (void)_setSelectedInfoOffset:(struct UIOffset)arg1;
@property(nonatomic, getter=_isSelected, setter=_setSelected:) BOOL _selected;
- (void)_updateToMatchCurrentState;
- (void)_updateInfoFrame;
- (void)_showSelectedIndicator:(BOOL)arg1 changeSelection:(BOOL)arg2;
- (id)_swappableImageView;
- (struct CGRect)_tabBarHitRect;
- (void)_setTabBarHitRect:(struct CGRect)arg1;
- (void)setImage:(id)arg1;
- (void)dealloc;
- (id)initWithImage:(id)arg1 selectedImage:(id)arg2 label:(id)arg3 withInsets:(struct UIEdgeInsets)arg4;
- (id)_selectedIndicatorView;
- (id)_scriptingInfo;

@end


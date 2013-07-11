/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/_UIBackdropView.h>

@class UIImageView;

__attribute__((visibility("hidden")))
@interface UICalloutBarBackground : _UIBackdropView
{
    float m_dividerOffsets[24];
    UIImageView *_blurMaskView;
    UIImageView *_tintMaskView;
    _UIBackdropView *_separatorView;
    struct CGRect _highlightRect;
}

@property(nonatomic) struct CGRect highlightRect; // @synthesize highlightRect=_highlightRect;
@property(retain, nonatomic) _UIBackdropView *separatorView; // @synthesize separatorView=_separatorView;
@property(retain, nonatomic) UIImageView *tintMaskView; // @synthesize tintMaskView=_tintMaskView;
@property(retain, nonatomic) UIImageView *blurMaskView; // @synthesize blurMaskView=_blurMaskView;
- (void)setBlurDisabled:(BOOL)arg1;
- (void)setHighlighted:(BOOL)arg1 forFrame:(struct CGRect)arg2;
- (void)layoutSubviews;
- (void)setDividerOffsets:(float *)arg1;
- (void)dealloc;
- (id)init;

@end


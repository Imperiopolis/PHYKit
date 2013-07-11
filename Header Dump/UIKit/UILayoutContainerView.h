/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIView.h>

NSCoding.h
__attribute__((visibility("hidden")))
@interface UILayoutContainerView : UIView <NSCoding>
{
    id _delegate;
    BOOL _usesRoundedCorners;
    float _cornerRadius;
    BOOL _usesInnerShadow;
    BOOL _shadowViewsInstalled;
    UIView *_shadowView;
}

@property(nonatomic) BOOL usesInnerShadow; // @synthesize usesInnerShadow=_usesInnerShadow;
@property(nonatomic) BOOL usesRoundedCorners; // @synthesize usesRoundedCorners=_usesRoundedCorners;
- (void)dealloc;
- (void)addSubview:(id)arg1;
- (void)_tearDownShadowViews;
- (void)_installShadowViews;
- (void)layoutSubviews;
@property(nonatomic) id delegate;
- (void)setBounds:(struct CGRect)arg1;
- (void)setFrame:(struct CGRect)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;

@end


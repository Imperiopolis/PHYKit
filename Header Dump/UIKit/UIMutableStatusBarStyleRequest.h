/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UIStatusBarStyleRequest.h>

@class NSNumber, UIColor;

__attribute__((visibility("hidden")))
@interface UIMutableStatusBarStyleRequest : UIStatusBarStyleRequest
{
}

- (id)copyWithZone:(struct _NSZone *)arg1;

// Remaining properties
@property(retain, nonatomic) UIColor *foregroundColor;
@property(nonatomic, getter=isLegacy) BOOL legacy;
@property(nonatomic) int legibilityStyle;
@property(retain, nonatomic) NSNumber *overrideHeight;
@property(nonatomic) int style;

@end


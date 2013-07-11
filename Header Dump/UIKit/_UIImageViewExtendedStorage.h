/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@class NSArray, UIImage;

__attribute__((visibility("hidden")))
@interface _UIImageViewExtendedStorage : NSObject
{
    BOOL _highlighted;
    UIImage *_image;
    UIImage *_highlightedImage;
    NSArray *_animationImages;
    NSArray *_highlightedAnimationImages;
    double _animationDuration;
    int _animationRepeatCount;
    int _drawMode;
    int _defaultRenderingMode;
    BOOL _masksTemplateImages;
    unsigned int _templateImageRenderingEffects;
}

- (void)animationDidStop:(id)arg1 finished:(BOOL)arg2;
- (void)dealloc;

@end


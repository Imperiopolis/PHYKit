//
//  UISlider.h
//  UIKit
//
//  Copyright (c) 2006-2013, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIControl.h>
#import <UIKit/UIKitDefines.h>
#import <QuartzCore/QuartzCore.h>

@class UIImageView, UIImage;

NS_CLASS_AVAILABLE_IOS(2_0) @interface UISlider : UIControl <NSCoding> {
  @package
    float _value;
    float _minValue;
    float _maxValue;
    CGFloat _alpha;

    CFMutableDictionaryRef _contentLookup;

    UIImageView *_minValueImageView;
    UIImageView *_maxValueImageView;
    UIImageView *_thumbView;
    UIImageView *_minTrackView;
    UIImageView *_maxTrackView;
    UIView      *_maxTrackClipView;

    struct {
	unsigned int continuous:1;
	unsigned int animating:1;
        unsigned int preparingToAnimate:1;
	unsigned int showValue:1;
	unsigned int trackEnabled:1;
	unsigned int creatingSnapshot:1;
	unsigned int thumbDisabled:1;
	unsigned int minTrackHidden:1;
    } _sliderFlags;

    CGFloat _hitOffset;
    
    UIColor *_minTintColor;
    UIColor *_maxTintColor;
    UIColor *_thumbTintColor;
    
    
    // look neue support
    CAShapeLayer *_trackMaskLayer;
    UIView *_trackContainerView;
    UIView *_thumbViewNeue;
    CAShapeLayer *_thumbViewNeueShape;
    BOOL _useLookNeue;
    
    
    BOOL _trackIsArtworkBased; // NO by default // will get set to YES when the user specify an artwork for BOTH the min and the max value trackImages
    BOOL _thumbIsArtworkBased; // NO by default // will get set to YES when the user specify an artwork the thumb image
    
    UIView *_minTrackViewNeue;
    UIView *_maxTrackViewNeue;
    CAGradientLayer *_maxTrackGradientLayer;
    BOOL _maxColorIsValid;
}

@property(nonatomic) float value;                                 // default 0.0. this value will be pinned to min/max
@property(nonatomic) float minimumValue;                          // default 0.0. the current value may change if outside new min value
@property(nonatomic) float maximumValue;                          // default 1.0. the current value may change if outside new max value

@property(nonatomic,retain) UIImage *minimumValueImage;          // default is nil. image that appears to left of control (e.g. speaker off)
@property(nonatomic,retain) UIImage *maximumValueImage;          // default is nil. image that appears to right of control (e.g. speaker max)

@property(nonatomic,getter=isContinuous) BOOL continuous;        // if set, value change events are generated any time the value changes due to dragging. default = YES

@property(nonatomic,retain) UIColor *minimumTrackTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
@property(nonatomic,retain) UIColor *maximumTrackTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
@property(nonatomic,retain) UIColor *thumbTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

- (void)setValue:(float)value animated:(BOOL)animated; // move slider at fixed velocity (i.e. duration depends on distance). does not send action

// set the images for the slider. there are 3, the thumb which is centered by default and the track. You can specify different left and right track
// e.g blue on the left as you increase and white to the right of the thumb. The track images should be 3 part resizable (via UIImage's resizableImage methods) along the direction that is longer

- (void)setThumbImage:(UIImage *)image forState:(UIControlState)state;
- (void)setMinimumTrackImage:(UIImage *)image forState:(UIControlState)state;
- (void)setMaximumTrackImage:(UIImage *)image forState:(UIControlState)state;

- (UIImage *)thumbImageForState:(UIControlState)state;
- (UIImage *)minimumTrackImageForState:(UIControlState)state;
- (UIImage *)maximumTrackImageForState:(UIControlState)state;

@property(nonatomic,readonly) UIImage* currentThumbImage;
@property(nonatomic,readonly) UIImage* currentMinimumTrackImage;
@property(nonatomic,readonly) UIImage* currentMaximumTrackImage;

// lets a subclass lay out the track and thumb as needed
- (CGRect)minimumValueImageRectForBounds:(CGRect)bounds;
- (CGRect)maximumValueImageRectForBounds:(CGRect)bounds;
- (CGRect)trackRectForBounds:(CGRect)bounds;
- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value;

@end

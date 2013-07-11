//
//  UIBarCommon.h
//  UIKit
//
//  Copyright (c) 2013 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UIBarMetrics) {
    UIBarMetricsDefault,
    UIBarMetricsLandscapePhone,
    UIBarMetricsDefaultPrompt = 101, // Applicable only in bars with the prompt property, such as UINavigationBar and UISearchBar
    UIBarMetricsLandscapePhonePrompt,
    };
    
typedef NS_ENUM(NSInteger, UIBarPosition) {
    UIBarPositionAny = 0,
    UIBarPositionBottom = 1, // The bar is at the bottom of its local context, and directional decoration draws accordingly (e.g., shadow above the bar).
    UIBarPositionTop = 2, // The bar is at the top of its local context, and directional decoration draws accordingly (e.g., shadow below the bar)
    UIBarPositionTopAttached = 3, // The bar is at the top of the screen (as well as its local context), and its background extends upward—currently only enough for the status bar.
    } NS_ENUM_AVAILABLE_IOS(7_0);
    
#define UIToolbarPosition UIBarPosition
#define UIToolbarPositionAny UIBarPositionAny
#define UIToolbarPositionBottom UIBarPositionBottom
#define UIToolbarPositionTop UIBarPositionTop
    
    
@protocol UIBarPositioning <NSObject> // UINavigationBar, UIToolbar, and UISearchBar conform to this
@property(nonatomic,readonly) UIBarPosition barPosition;
@end

@protocol UIBarPositioningDelegate <NSObject> // UINavigationBarDelegate, UIToolbarDelegate, and UISearchBarDelegate all extend from this
@optional
/* Implement this method on your manual bar delegate when not managed by a UIKit controller.
 UINavigationBar and UISearchBar default to UIBarPositionTop, UIToolbar defaults to UIBarPositionBottom.
 This message will be sent when the bar moves to a window.
 */
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar;
@end
    

//
//  PHYView.h
//  DragonDrop
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import <Foundation/Foundation.h>
#import "PHYDynamicBehavior.h"

@interface PHYView : NSObject <PHYDynamicItem>

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setNeedsDisplay;

- (PHYView *)hitTest:(CGPoint)point;
- (BOOL)pointInside:(CGPoint)point;

- (void)removeFromSuperview;
- (void)insertSubview:(PHYView *)view atIndex:(NSInteger)index;
- (void)exchangeSubviewAtIndex:(NSInteger)index1 withSubviewAtIndex:(NSInteger)index2;

- (void)addSubview:(PHYView *)view;
- (void)insertSubview:(PHYView *)view belowSubview:(PHYView *)siblingSubview;
- (void)insertSubview:(PHYView *)view aboveSubview:(PHYView *)siblingSubview;

- (void)bringSubviewToFront:(PHYView *)view;
- (void)sendSubviewToBack:(PHYView *)view;

- (void)didAddSubview:(PHYView *)subview;
- (void)willRemoveSubview:(PHYView *)subview;

- (void)willMoveToSuperview:(PHYView *)newSuperview;
- (void)didMoveToSuperview;

@property (nonatomic) CGRect frame;
@property (nonatomic) CGRect bounds;
@property (nonatomic) CGPoint center;
@property (nonatomic) CGAffineTransform transform;
@property (nonatomic, readonly) id superview;
@property (nonatomic, readonly) NSWindow *window;
@property (nonatomic, readonly) NSArray *subviews;
@property (nonatomic) CGFloat alpha;
@property (nonatomic, getter=isOpaque) BOOL opaque;
@property (nonatomic) BOOL clearsContextBeforeDrawing;
@property (nonatomic, copy) NSColor *backgroundColor;
@property (nonatomic, readonly) CALayer *layer;
@property (nonatomic) BOOL clipsToBounds;
@property (nonatomic, getter=isHidden) BOOL hidden;
@property (nonatomic, getter=isUserInteractionEnabled) BOOL userInteractionEnabled;
@property (nonatomic) CGFloat contentScaleFactor;

@end

//
//  PHYDynamicAnimator.h
//  PHYKit
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import <Foundation/Foundation.h>

@class PHYDynamicBehavior;
@class PHYDynamicAnimator;
@protocol PHYDynamicItem;

@protocol PHYDynamicAnimatorDelegate <NSObject>

@optional
- (void)dynamicAnimatorWillResume:(PHYDynamicAnimator*)animator;
- (void)dynamicAnimatorDidPause:(PHYDynamicAnimator*)animator;

@end

@interface PHYDynamicAnimator: NSObject

- (instancetype)initWithReferenceView:(NSView*)view;

- (void)addBehavior:(PHYDynamicBehavior *)behavior;
- (void)removeBehavior:(PHYDynamicBehavior *)behavior;
- (void)removeAllBehaviors;
// Returns the dynamic items associated with the animator’s behaviors that intersect a specified rectangle
- (NSArray*)itemsInRect:(CGRect)rect;
// Update the item state in the animator if an external change was made to this item
- (void)updateItemUsingCurrentState:(id <PHYDynamicItem>)item;

- (NSTimeInterval)elapsedTime;

@property (nonatomic, readonly) NSView* referenceView;
@property (nonatomic, readonly, copy) NSArray* behaviors;
@property (nonatomic, readonly, getter = isRunning) BOOL running;
@property (nonatomic, weak) id <PHYDynamicAnimatorDelegate> delegate;

@end

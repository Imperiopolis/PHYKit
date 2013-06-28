//
//  PHYDynamicAnimator.h
//  DragonDrop
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import <Foundation/Foundation.h>

@class PHYDynamicBehavior;
@class PHYDynamicAnimator;

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
- (NSArray*)itemsInRect:(CGRect)rect;
- (NSTimeInterval)elapsedTime;

@property (nonatomic, readonly) NSView* referenceView;
@property (nonatomic, readonly, copy) NSArray* behaviors;
@property (nonatomic, readonly, getter = isRunning) BOOL running;
@property (nonatomic, weak) id <PHYDynamicAnimatorDelegate> delegate;

@end

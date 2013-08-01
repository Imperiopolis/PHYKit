//
//  PHYDynamicBehavior.h
//  PHYKit
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import <Foundation/Foundation.h>

@protocol PHYDynamicItem <NSObject>

@property (nonatomic, readwrite) CGPoint center;
@property (nonatomic, readonly) CGRect bounds;
@property (nonatomic, readwrite) CGAffineTransform transform;

@end

@class PHYDynamicAnimator;

@interface PHYDynamicBehavior : NSObject

- (void)addChildBehavior:(PHYDynamicBehavior *)behavior;
- (void)removeChildBehavior:(PHYDynamicBehavior *)behavior;

- (void)willMoveToAnimator:(PHYDynamicAnimator *)animator; // nil when being removed from an animator

@property (nonatomic, readonly, copy) NSArray *childBehaviors;
@property (nonatomic, readonly) PHYDynamicAnimator *dynamicAnimator;
@property (nonatomic, copy) void (^action)(void);

@end

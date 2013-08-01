//
//  PHYDynamicBehavior.h
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
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
- (void)willMoveToAnimator:(PHYDynamicAnimator *)animator;

@property (nonatomic, readonly, copy) NSArray *childBehaviors;
@property (assign) PHYDynamicAnimator *dynamicAnimator;
@property (nonatomic, copy) void (^action)(void);

@end

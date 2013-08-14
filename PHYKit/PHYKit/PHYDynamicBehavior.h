//
//  PHYDynamicBehavior.h
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import <Foundation/Foundation.h>

typedef struct PHYOffset
{
    CGFloat horizontal, vertical; // specify amount to offset a position, positive for right or down, negative for left or up
} PHYOffset;

static inline PHYOffset PHYOffsetMake(CGFloat horizontal, CGFloat vertical)
{
    PHYOffset offset = {horizontal, vertical};
    return offset;
};

#define PHYOffsetZero                   (PHYOffsetMake(0, 0))
#define CGPointFromPHYOffset(offset)    (CGPointMake(offset.horizontal, offset.vertical))


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
@property (nonatomic, readonly, copy) NSArray* items;

@property (nonatomic, copy) void (^action)(void);

@end

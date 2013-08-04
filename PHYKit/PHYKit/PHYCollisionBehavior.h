//
//  PHYDynamicCollisionBehavior.h
//  PHYKit
//
//  Created by Nora Trapp on 6/29/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYDynamicBehavior.h"

@class PHYCollisionBehavior;

typedef NS_OPTIONS(NSUInteger, PHYCollisionBehaviorMode)
{
    PHYCollisionBehaviorModeItems        = 1 << 0,
    PHYCollisionBehaviorModeBoundaries   = 1 << 1,
    PHYCollisionBehaviorModeEverything   = NSUIntegerMax
};

@protocol PHYCollisionBehaviorDelegate <NSObject>
@optional

- (void)collisionBehavior:(PHYCollisionBehavior*)behavior beganContactForItem:(id <PHYDynamicItem>)item1 withItem:(id <PHYDynamicItem>)item2 atPoint:(CGPoint)p;
- (void)collisionBehavior:(PHYCollisionBehavior*)behavior endedContactForItem:(id <PHYDynamicItem>)item1 withItem:(id <PHYDynamicItem>)item2;

// The identifier of a boundary created with translatesReferenceBoundsIntoBoundary or setTranslatesReferenceBoundsIntoBoundaryWithInsets is nil
- (void)collisionBehavior:(PHYCollisionBehavior*)behavior beganContactForItem:(id <PHYDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier atPoint:(CGPoint)p;
- (void)collisionBehavior:(PHYCollisionBehavior*)behavior endedContactForItem:(id <PHYDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier;

@end

@interface PHYCollisionBehavior : PHYDynamicBehavior

- (instancetype)initWithItems:(NSArray *)items;

- (void)addItem:(id <PHYDynamicItem>)item;
- (void)removeItem:(id <PHYDynamicItem>)item;

- (void)setTranslatesReferenceBoundsIntoBoundaryWithInsets:(NSEdgeInsets)insets;
- (void)addBoundaryWithIdentifier:(id <NSCopying>)identifier forPath:(NSBezierPath*)bezierPath;
- (void)addBoundaryWithIdentifier:(id <NSCopying>)identifier fromPoint:(CGPoint)p1 toPoint:(CGPoint)p2;
- (NSBezierPath*)boundaryWithIdentifier:(id <NSCopying>)identifier;
- (void)removeBoundaryWithIdentifier:(id <NSCopying>)identifier;
- (void)removeAllBoundaries;

@property (nonatomic, readwrite) PHYCollisionBehaviorMode collisionMode;
@property (nonatomic, readwrite) BOOL translatesReferenceBoundsIntoBoundary;
@property (nonatomic, readonly, copy) NSArray* boundaryIdentifiers;
@property (nonatomic, assign, readwrite) id <PHYCollisionBehaviorDelegate> collisionDelegate;

@end

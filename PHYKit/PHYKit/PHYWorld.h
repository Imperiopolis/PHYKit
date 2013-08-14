//
//  PHYWorld.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//
//

typedef NS_OPTIONS(NSInteger, PHYCollisionCategory)
{
    PHYNoCollisions =           0,
    PHYReferenceCollisions =    1 << 0,
    PHYBoundaryCollisions =     1 << 1,
    PHYItemsCollisions  =       1 << 2
};

typedef void(^PHYWorldBlock)(void);

@class PHYBody;
@protocol PHYDynamicItem;

@interface PHYWorld : NSObject

@property (nonatomic) struct CGPoint gravity;
@property (nonatomic, readonly) NSArray *bodies;

- (instancetype)initWithReferenceView:(NSView*)referenceView;

- (void)stepWithTime:(NSTimeInterval)timeInterval;
- (void)stepWithTime:(NSTimeInterval)timeInterval velocityIterations:(NSUInteger)velocityIterations positionIterations:(NSUInteger)positionIterations;

- (void)removeAllBodies;
- (void)removeBody:(PHYBody*)body;
- (void)addBody:(PHYBody*)body;
- (BOOL)hasBodies;

- (id)bodyAlongRayStart:(struct CGPoint)startPoint end:(struct CGPoint)endPoint;
- (id)bodyInRect:(struct CGRect)rect;
- (id)bodyAtPoint:(struct CGPoint)point;
- (void)enumerateBodiesAlongRayStart:(struct CGPoint)startPoint end:(struct CGPoint)endPoint usingBlock:(PHYWorldBlock)block;
- (void)enumerateBodiesInRect:(struct CGRect)rect usingBlock:(PHYWorldBlock)block;
- (void)enumerateBodiesAtPoint:(struct CGPoint)point usingBlock:(PHYWorldBlock)block;

@end


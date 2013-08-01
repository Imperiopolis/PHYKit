//
//  PHYWorld.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//
//

#import <Foundation/NSObject.h>

typedef void(^PHYWorldBlock)(void);

@class NSMutableArray;
@protocol PHYDynamicItem;

@interface PHYWorld : NSObject

@property (nonatomic) struct CGPoint gravity;
@property (nonatomic, readonly) NSArray *bodies;

+ (instancetype)world;
- (void)stepWithTime:(NSTimeInterval)timeInterval;
- (void)stepWithTime:(NSTimeInterval)timeInterval velocityIterations:(NSUInteger)velocityIterations positionIterations:(NSUInteger)positionIterations;

- (void)removeAllBodies;
- (void)removeBody:(id<PHYDynamicItem>)body;
- (void)addBody:(id<PHYDynamicItem>)body;
- (BOOL)hasBodies;

- (id)bodyAlongRayStart:(struct CGPoint)startPoint end:(struct CGPoint)endPoint;
- (id)bodyInRect:(struct CGRect)rect;
- (id)bodyAtPoint:(struct CGPoint)point;
- (void)enumerateBodiesAlongRayStart:(struct CGPoint)startPoint end:(struct CGPoint)endPoint usingBlock:(PHYWorldBlock)block;
- (void)enumerateBodiesInRect:(struct CGRect)rect usingBlock:(PHYWorldBlock)block;
- (void)enumerateBodiesAtPoint:(struct CGPoint)point usingBlock:(PHYWorldBlock)block;

@end


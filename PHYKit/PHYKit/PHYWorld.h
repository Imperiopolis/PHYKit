//
//  PHYWorld.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//
//

#import <Foundation/NSObject.h>
#import "CDStructures.h"

@class NSMutableArray;

@interface PHYWorld : NSObject <NSCoding>
{
    struct b2World *_world;
    struct b2Vec2 _gravity;
    _Bool _doSleep;
    double _accumulatedDt;
    struct PHYContactListener _contactListener;
    float _speed;
    NSMutableArray *_bodies;
    NSMutableArray *_joints;
    NSMutableArray *_postStepBlocks;
}

+ (id)world;
- (id).cxx_construct;
- (void).cxx_destruct;
- (BOOL)stepWithTime:(double)arg1 velocityIterations:(unsigned int)arg2 positionIterations:(unsigned int)arg3;
- (void)removeAllJoints;
- (void)removeJoint:(id)arg1;
- (void)addJoint:(id)arg1;
- (void)removeAllBodies;
- (void)removeBody:(id)arg1;
- (void)addBody:(id)arg1;
- (id)bodies;
@property(nonatomic) id <PHYContactDelegate> contactDelegate;
- (id)collisionDelegate;
- (void)setCollisionDelegate:(id)arg1;
@property(nonatomic) struct CGPoint gravity;
- (BOOL)hasBodies;
- (id)copy;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)dealloc;
- (id)init;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
@property(nonatomic) float speed;
- (id)bodyAlongRayStart:(struct CGPoint)arg1 end:(struct CGPoint)arg2;
- (id)bodyInRect:(struct CGRect)arg1;
- (id)bodyAtPoint:(struct CGPoint)arg1;
- (void)enumerateBodiesAlongRayStart:(struct CGPoint)arg1 end:(struct CGPoint)arg2 usingBlock:(id)arg3;
- (void)enumerateBodiesInRect:(struct CGRect)arg1 usingBlock:(id)arg2;
- (void)enumerateBodiesAtPoint:(struct CGPoint)arg1 usingBlock:(id)arg2;
- (void)_runBlockOutsideOfTimeStep:(id)arg1;
@property(nonatomic) _Bool _doSleep;
@property(retain, nonatomic) NSMutableArray *_bodies;
@property(nonatomic) struct b2Vec2 _gravity;
@property(nonatomic) struct b2World *_world;

@end


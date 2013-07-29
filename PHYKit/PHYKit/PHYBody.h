//
//  PHYBody.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//
//

#import <Foundation/NSObject.h>

@class NSArray, NSMutableArray, PHYWorld;

@interface PHYBody : NSObject <NSCopying, NSCoding>
{
    id <NSObject> _representedObject;
    struct b2BodyDef _bodyDef;
    struct b2Body *_body;
    int _dynamicType;
    struct b2FixtureDef _fixtureDef;
    struct b2Fixture *_fixture;
    PHYWorld *_world;
    NSMutableArray *_joints;
    BOOL _inUse;
    int _shapeType;
    struct CGPath *_path;
    struct CGPoint _p0;
    struct CGPoint _p1;
    struct CGSize _size;
    float _radius;
    id _postStepBlock;
}

+ (id)bodyWithEdgeLoopFromPath:(struct CGPath *)arg1;
+ (id)bodyWithEdgeChainFromPath:(struct CGPath *)arg1;
+ (id)bodyWithPolygonFromPath:(struct CGPath *)arg1;
+ (id)bodyWithEdgeFromPoint:(struct CGPoint)arg1 toPoint:(struct CGPoint)arg2;
+ (id)bodyWithRectangleOfSize:(struct CGSize)arg1;
+ (id)bodyWithCircleOfRadius:(float)arg1;
@property(copy, nonatomic) id postStepBlock; // @synthesize postStepBlock=_postStepBlock;
- (id).cxx_construct;
- (void).cxx_destruct;
- (id)allContactedBodies;
- (id)description;
- (id)_descriptionFormat;
- (id)copy;
- (id)copyWithZone:(struct _NSZone *)arg1;
@property(nonatomic, getter=isDynamic) BOOL dynamic;
@property(nonatomic) float friction;
@property(nonatomic) float restitution;
@property(readonly, nonatomic) float area;
@property(nonatomic) float density;
@property(nonatomic) float mass;
@property(readonly, nonatomic) NSArray *joints;
@property(nonatomic, getter=isResting) BOOL resting;
@property(nonatomic) BOOL allowsRotation;
@property(nonatomic) float angularVelocity;
@property(nonatomic) struct CGPoint velocity;
@property(nonatomic) unsigned int contactTestBitMask;
@property(nonatomic) unsigned int collisionBitMask;
@property(nonatomic) unsigned int categoryBitMask;
@property(nonatomic) BOOL affectedByGravity;
@property(nonatomic) BOOL usesPreciseCollisionDetection;
- (void)applyUnscaledImpulse:(struct CGPoint)arg1;
- (void)applyUnscaledImpulse:(struct CGPoint)arg1 atPoint:(struct CGPoint)arg2;
- (void)applyUnscaledForce:(struct CGPoint)arg1;
- (void)applyUnscaledForce:(struct CGPoint)arg1 atPoint:(struct CGPoint)arg2;
- (void)applyAngularImpulse:(float)arg1;
- (void)applyImpulse:(struct CGPoint)arg1;
- (void)applyImpulse:(struct CGPoint)arg1 atPoint:(struct CGPoint)arg2;
- (void)applyTorque:(float)arg1;
- (void)applyForce:(struct CGPoint)arg1;
- (void)applyForce:(struct CGPoint)arg1 atPoint:(struct CGPoint)arg2;
@property(nonatomic) float angularDamping;
@property(nonatomic) float linearDamping;
@property(nonatomic) float rotation;
- (BOOL)_allowSleep;
- (void)set_allowSleep:(BOOL)arg1;
@property(nonatomic) struct CGPoint position;
@property(nonatomic) __weak id <NSObject> representedObject;
- (id)initWithEdgeLoopFromPath:(struct CGPath *)arg1;
- (id)initWithEdgeChainFromPath:(struct CGPath *)arg1;
- (id)initWithPolygonFromPath:(struct CGPath *)arg1;
- (id)initWithEdgeFromPoint:(struct CGPoint)arg1 toPoint:(struct CGPoint)arg2;
- (id)initWithRectangleOfSize:(struct CGSize)arg1;
- (id)initWithCircleOfRadius:(float)arg1;
- (void)dealloc;
- (id)init;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
@property(nonatomic) struct b2Body *_body;
@property(nonatomic) struct b2BodyDef _bodyDef;
- (void)set_inUse:(BOOL)arg1;
- (BOOL)_inUse;
- (void)set_joints:(id)arg1;
- (id)_joints;
- (id)_world;
- (void)set_world:(id)arg1;
@property(nonatomic) struct b2FixtureDef _fixtureDef;
@property(nonatomic) struct b2Fixture *_fixture;
- (void)setActive:(BOOL)arg1;
- (BOOL)active;
- (BOOL)isSensor;
- (void)setIsSensor:(BOOL)arg1;

@end


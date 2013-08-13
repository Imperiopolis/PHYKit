//
//  PHYBody.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//
//

#import <Foundation/NSObject.h>

@class NSArray, NSMutableArray, PHYWorld, PHYJoint;
@protocol PHYDynamicItem;

@interface PHYBody : NSObject

@property(nonatomic) BOOL dynamic;
@property(nonatomic) float friction;
@property(nonatomic) float restitution;
@property(readonly, nonatomic) float area;
@property(nonatomic) float density;
@property(nonatomic) float mass;
@property(readonly, nonatomic) NSArray *joints;
@property(nonatomic) BOOL resting;
@property(nonatomic) BOOL allowsRotation;
@property(nonatomic) float angularVelocity;
@property(nonatomic) struct CGPoint velocity;
@property(nonatomic) unsigned int contactTestBitMask;
@property(nonatomic) unsigned int collisionBitMask;
@property(nonatomic) unsigned int categoryBitMask;
@property(nonatomic) BOOL affectedByGravity;
@property(nonatomic) BOOL usesPreciseCollisionDetection;
@property(nonatomic) float angularDamping;
@property(nonatomic) float linearDamping;
@property(nonatomic) float rotation;
@property(nonatomic) struct CGPoint position;
@property(weak) id<PHYDynamicItem> dynamicItem;

@property(nonatomic) struct b2Body *body;
@property(nonatomic) struct b2BodyDef bodyDef;
@property(nonatomic) struct b2FixtureDef fixtureDef;
@property(nonatomic) struct b2Fixture *fixture;

@property (weak, nonatomic) PHYWorld *world;

- (id)initWithDynamicItem:(id<PHYDynamicItem>)dynamicItem;
- (id)initWithWorld:(PHYWorld*)world;

- (void)applyUnscaledImpulse:(struct CGPoint)impulse;
- (void)applyUnscaledImpulse:(struct CGPoint)impulse atPoint:(struct CGPoint)point;

- (void)applyUnscaledForce:(struct CGPoint)force;
- (void)applyUnscaledForce:(struct CGPoint)force atPoint:(struct CGPoint)point;

- (void)applyAngularImpulse:(float)impulse;

- (void)applyImpulse:(struct CGPoint)impulse;
- (void)applyImpulse:(struct CGPoint)impulse atPoint:(struct CGPoint)point;

- (void)applyTorque:(float)torque;

- (void)applyForce:(struct CGPoint)force;
- (void)applyForce:(struct CGPoint)force atPoint:(struct CGPoint)point;

- (void)addJoint:(PHYJoint*)joint;
- (void)removeJoint:(PHYJoint*)joint;

@end


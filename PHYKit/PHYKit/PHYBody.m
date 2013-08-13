//
//  PHYBody.m
//  PHYKit
//
//  Created by Nora Trapp on 8/2/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYGeometry.h"
#import "PHYBody.h"
#import "PHYWorld.h"
#import "PHYJoint.h"
#import "PHYDynamicBehavior.h"

#import <Box2D/Box2D.h>

@interface PHYWorld (PHYPrivateWorld)
- (b2World*)b2world;
@end

@interface PHYBody ()
{
    NSMutableSet *_joints;
}

@property (nonatomic) float area;

@end

@implementation PHYBody

- (id)initWithDynamicItem:(id<PHYDynamicItem>)dynamicItem
{
    if ((self = [super init]))
    {
        self.dynamicItem = dynamicItem;
        _joints = [NSMutableSet set];
    }

    return self;
}

- (id)initWithWorld:(PHYWorld*)world
{
    if ((self = [super init]))
    {
        self.world = world;
    }

    return self;
}

- (void)dealloc
{
    for (PHYJoint *joint in self.joints)
    {
        if (self.world)
        {
            [self.world b2world]->DestroyJoint(joint.joint);
            joint.joint = nil;
        }
    }

    if (self.body)
    {
        if (self.world)
        {
            self.body->DestroyFixture(self.fixture);
            [self.world b2world]->DestroyBody(self.body);
        }
        self.body = nil;
    }
}

- (NSArray*)joints
{
    return [_joints allObjects];
}

- (void)setWorld:(PHYWorld *)world
{
    if (_world)
    {
        self.body->DestroyFixture(self.fixture);
        [_world b2world]->DestroyBody(self.body);
    }
    
    _world = world;

    if (_world)
    {
        // Define the dynamic body.

        CGPoint center = CGPointZero;
        CGSize boxSize = CGSizeZero;
        CGPoint origin = CGPointZero;

        if (self.dynamicItem)
        {
            center = self.dynamicItem.center;
            boxSize = CGSizeMake(PointsToMeters(CGRectGetWidth(self.dynamicItem.bounds)) / 2.0,
                                 PointsToMeters(CGRectGetHeight(self.dynamicItem.bounds)) / 2.0);
            origin = self.dynamicItem.bounds.origin;
        }

        _bodyDef.position.Set(center.x / kPointsToMeterRatio,
                              center.y / kPointsToMeterRatio);

        // Tell the physics world to create the body
        self.body = [_world b2world]->CreateBody(&_bodyDef);
        self.affectedByGravity = NO;

        // Define another box shape for our dynamic body.
        b2PolygonShape dynamicBox;
        dynamicBox.SetAsBox(boxSize.width, boxSize.height, CGPointTob2Vec2(origin), 0.0);

        self.area = boxSize.width * boxSize.height;

        // Define the dynamic body fixture.
        _fixtureDef.shape = &dynamicBox;
        _fixtureDef.filter.maskBits = PHYNoCollisions;
        _fixtureDef.density = 1.0f;
        _fixtureDef.friction = 0.2f;
        _fixtureDef.restitution = 0.2f;

        self.fixture = self.body->CreateFixture(&_fixtureDef);
        
        // a dynamic body reacts to forces right away
        self.body->SetType(self.dynamic ? b2_dynamicBody : b2_staticBody);
    }
}

- (void)setDynamic:(BOOL)dynamic
{
    if (self.body)
    {
        _dynamic = dynamic;
        
        self.body->SetType(_dynamic ? b2_dynamicBody : b2_staticBody);
    }
}

- (void)setDensity:(float)density
{
    self.fixture->SetDensity(density);
}

- (float)density
{
    return self.fixture->GetDensity();
}

- (void)setFriction:(float)friction
{
    self.fixture->SetFriction(friction);
}

- (float)friction
{
    return self.fixture->GetFriction();
}

- (void)setRestitution:(float)restitution
{
    self.fixture->SetRestitution(restitution);
}

- (float)restitution
{
    return self.fixture->GetRestitution();
}

- (void)setMass:(float)mass
{
    _mass = mass;

    self.density = mass / self.area;
}

- (void)setResting:(BOOL)resting
{
    self.body->SetAwake(resting);
}

- (BOOL)resting
{
    return self.body->IsAwake();
}

- (void)setAllowsRotation:(BOOL)allowsRotation
{
    self.body->SetFixedRotation(allowsRotation);
}

- (BOOL)allowsRotation
{
    return self.body->IsFixedRotation();
}

- (void)setAngularVelocity:(float)angularVelocity
{
    self.body->SetAngularVelocity(angularVelocity);
}

- (float)angularVelocity
{
    return self.body->GetAngularVelocity();
}

- (void)setVelocity:(struct CGPoint)velocity
{
    self.body->SetLinearVelocity(CGPointTob2Vec2(velocity));
}

- (CGPoint)velocity
{
    return b2Vec2ToCGPoint(self.body->GetLinearVelocity());
}

- (void)setAffectedByGravity:(BOOL)affectedByGravity
{
    self.body->SetGravityScale(affectedByGravity ? 1 : 0);
}

- (BOOL)affectedByGravity
{
    return (self.body->GetGravityScale() != 0);
}

- (void)setAngularDamping:(float)angularDamping
{
    self.body->SetAngularDamping(angularDamping);
}

- (float)angularDamping
{
    return self.body->GetAngularDamping();
}

- (void)setLinearDamping:(float)linearDamping
{
    self.body->SetLinearDamping(linearDamping);
}

- (float)linearDamping
{
    return self.body->GetLinearDamping();
}

- (void)setRotation:(float)rotation
{
    self.body->SetTransform(self.body->GetPosition(), rotation);
}

- (float)rotation
{
    return self.body->GetAngle();
}

- (void)setPosition:(struct CGPoint)position
{
    self.body->SetTransform(CGPointTob2Vec2(position), self.body->GetAngle());
}

- (CGPoint)position
{
    return b2Vec2ToCGPoint(self.body->GetPosition());
}

- (unsigned int)categoryBitMask
{
    b2Filter filter = self.fixture->GetFilterData();

    return filter.categoryBits;
}

- (void)setCategoryBitMask:(unsigned int)categoryBitMask
{
    b2Filter filter = self.fixture->GetFilterData();
    filter.categoryBits = categoryBitMask;

    self.fixture->SetFilterData(filter);
}

- (unsigned int)collisionBitMask
{
    b2Filter filter = self.fixture->GetFilterData();

    return filter.maskBits;
}


- (void)setCollisionBitMask:(unsigned int)collisionBitMask
{
    b2Filter filter = self.fixture->GetFilterData();
    filter.maskBits = collisionBitMask;

    self.fixture->SetFilterData(filter);
}

- (void)applyUnscaledImpulse:(struct CGPoint)impulse
{
    self.body->ApplyLinearImpulse(CGPointTob2Vec2(impulse), self.body->GetPosition());
}

- (void)applyUnscaledImpulse:(struct CGPoint)impulse atPoint:(struct CGPoint)point
{
    self.body->ApplyLinearImpulse(CGPointTob2Vec2(impulse), CGPointTob2Vec2(point));
}

- (void)applyUnscaledForce:(struct CGPoint)force
{

}

- (void)applyUnscaledForce:(struct CGPoint)force atPoint:(struct CGPoint)point
{

}

- (void)applyAngularImpulse:(float)impulse
{

}

- (void)applyImpulse:(struct CGPoint)impulse
{

}

- (void)applyImpulse:(struct CGPoint)impulse atPoint:(struct CGPoint)point
{

}

- (void)applyTorque:(float)torque
{

}

- (void)applyForce:(struct CGPoint)force
{

}

- (void)applyForce:(struct CGPoint)force atPoint:(struct CGPoint)point
{
    
}

- (void)addJoint:(PHYJoint*)joint
{
    [_joints addObject: joint];
    
    if (!joint.joint)
    {
        joint.joint = [self.world b2world]->CreateJoint(joint.jointDef);
    }
}

- (void)removeJoint:(PHYJoint*)joint
{
    [_joints removeObject: joint];

    if (joint.joint)
    {
        [self.world b2world]->DestroyJoint(joint.joint);
        joint.joint = nil;
    }
}

@end

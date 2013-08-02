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
#import "PHYDynamicBehavior.h"

#import <Box2D/Box2D.h>

@interface PHYWorld (PHYB2World)
- (b2World*)_world;
@end

@interface PHYBody ()

@property (strong) NSMutableArray *joints;

@end

@implementation PHYBody

- (id)initWithDynamicItem:(id<PHYDynamicItem>)dynamicItem
{
    if ((self = [super init]))
    {
        self.dynamicItem = dynamicItem;
    }

    return self;
}

- (void)dealloc
{
    self.body->DestroyFixture(self.fixture);
    [self.world _world]->DestroyBody(self.body);
    self.body = nil;
}

- (void)setWorld:(PHYWorld *)world
{
    if (_world)
    {
        self.body->DestroyFixture(self.fixture);
        [_world _world]->DestroyBody(self.body);
    }
    
    _world = world;

    if (_world)
    {
        // Define the dynamic body.
    
        CGPoint p = self.dynamicItem.center;
        CGSize boxSize = CGSizeMake(CGRectGetWidth(self.dynamicItem.bounds) / kPointsToMeterRatio / 2.0,
                                    CGRectGetHeight(self.dynamicItem.bounds) / kPointsToMeterRatio / 2.0);

        _bodyDef.position.Set(p.x / kPointsToMeterRatio,
                              p.y / kPointsToMeterRatio);

        // Tell the physics world to create the body
        self.body = [self.world _world]->CreateBody(&_bodyDef);

        // Define another box shape for our dynamic body.
        b2PolygonShape dynamicBox;

        dynamicBox.SetAsBox(boxSize.width, boxSize.height);

        // Define the dynamic body fixture.
        _fixtureDef.shape = &dynamicBox;
        
        self.fixture = self.body->CreateFixture(&_fixtureDef);
        
        // a dynamic body reacts to forces right away
        self.body->SetType(self.dynamic ? b2_dynamicBody : b2_staticBody);
    }
}

- (void)setDynamic:(BOOL)dynamic
{
    if (dynamic)
    {
        _bodyDef.type = b2_dynamicBody;
    }
    else
    {
        _bodyDef.type = b2_staticBody;
    }

    _dynamic = dynamic;

    self.body->SetType(_dynamic ? b2_dynamicBody : b2_staticBody);
}

- (void)setDensity:(float)density
{
    _fixtureDef.density = density;
}

- (float)density
{
    return _fixtureDef.density;
}

- (void)setFriction:(float)friction
{
    _fixtureDef.friction = friction;
}

- (float)friction
{
    return _fixtureDef.friction;
}

- (void)setRestitution:(float)restitution
{
    _fixtureDef.restitution = restitution;
}

- (float)restitution
{
    return _fixtureDef.restitution;
}

- (float)area
{
    return self.dynamicItem.bounds.size.width * self.dynamicItem.bounds.size.height;
}

- (void)setMass:(float)mass
{
    _mass = mass;

    _fixtureDef.density = mass / self.area;
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

- (void)applyUnscaledImpulse:(struct CGPoint)impulse
{

}

- (void)applyUnscaledImpulse:(struct CGPoint)impulse atPoint:(struct CGPoint)point
{

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

@end

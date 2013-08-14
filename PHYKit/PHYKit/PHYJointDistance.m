//
//  PHYJointDistance.m
//  PHYKit
//
//  Created by Nora Trapp on 8/4/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYJointDistance.h"
#import "PHYGeometry.h"
#import "PHYBody.h"
#import "PHYWorld.h"

#import <Box2D/Box2D.h>

@interface PHYWorld (PHYPrivateWorld)
- (b2World*)b2world;
- (PHYBody*)groundBody;
@end

@interface PHYJointDistance ()
{
    struct b2DistanceJointDef _jointDef;
    struct b2DistanceJoint *_joint;
    struct CGPoint _anchorA;
    struct CGPoint _anchorB;
}

@end

@implementation PHYJointDistance

- (id)initWithBodyA:(PHYBody*)bodyA bodyB:(PHYBody*)bodyB localAnchorA:(struct CGPoint)localAnchorA localAnchorB:(struct CGPoint)localAnchorB
{
    if ((self = [super init]))
    {
        self.bodyA = bodyA;
        self.bodyB = bodyB;

        if (self.bodyA.world == self.bodyB.world)
        {
            self.bodyA = bodyA;
            self.bodyB = bodyB;
            
            if (!self.bodyB)
            {
                self.bodyB = [[PHYBody alloc] initWithWorld:bodyA.world];
            }
            
            _jointDef.bodyA = self.bodyA.body;
            _jointDef.bodyB = self.bodyB.body;
            
            b2Vec2 anchorA = _jointDef.bodyA->GetWorldPoint(CGPointTob2Vec2(localAnchorA));
            b2Vec2 anchorB = _jointDef.bodyB->GetWorldPoint(CGPointTob2Vec2(localAnchorB));
            
            _anchorA = b2Vec2ToCGPoint(anchorA);
            _anchorB = b2Vec2ToCGPoint(anchorB);
            
            _jointDef.localAnchorA = CGPointTob2Vec2(localAnchorA);
            _jointDef.localAnchorB = CGPointTob2Vec2(localAnchorB);
            
            _jointDef.Initialize(self.bodyA.body, self.bodyB.body, anchorA, anchorB);
            
            [self.bodyA addJoint: self];
            [self.bodyB addJoint: self];
            
            if (!bodyB)
            {
                self.bodyB.position = _anchorA;
            }
        }
    }
    return self;
}

- (id)initWithBodyA:(PHYBody*)bodyA bodyB:(PHYBody*)bodyB anchorA:(struct CGPoint)anchorA anchorB:(struct CGPoint)anchorB
{
    if ((self = [super init]))
    {
        self.bodyA = bodyA;
        self.bodyB = bodyB;

        if (!self.bodyB)
        {
            self.bodyB = [[PHYBody alloc] initWithWorld:bodyA.world];
        }

        _jointDef.bodyA = self.bodyA.body;
        _jointDef.bodyB = self.bodyB.body;

        _anchorA = anchorA;
        _anchorB = anchorB;

        b2Vec2 localAnchorA = _jointDef.bodyA->GetLocalPoint(CGPointTob2Vec2(anchorA));
        b2Vec2 localAnchorB = _jointDef.bodyB->GetLocalPoint(CGPointTob2Vec2(anchorB));

        _jointDef.localAnchorA = localAnchorA;
        _jointDef.localAnchorB = localAnchorB;

        _jointDef.Initialize(self.bodyA.body, self.bodyB.body, CGPointTob2Vec2(anchorA), CGPointTob2Vec2(anchorB));

        [self.bodyA addJoint: self];
        [self.bodyB addJoint: self];

        if (!bodyB)
        {
            self.bodyB.position = _anchorA;
        }
    }
    return self;
}

- (struct b2JointDef *)jointDef
{
    return &_jointDef;
}

- (void)setLength:(float)length
{
    if (_joint)
    {
        _joint->SetLength(PointsToMeters(length));
    }
}

- (float)length
{
    if (_joint)
    {
        return _joint->GetLength();
    }
    else
    {
        return 0;
    }
}

- (void)setFrequency:(float)frequency
{
    if (_joint)
    {
        _joint->SetFrequency(frequency);
    }
}

- (float)frequency
{
    if (_joint)
    {
        return _joint->GetFrequency();
    }
    else
    {
        return 0;
    }
}

- (void)setDamping:(float)damping
{
    if (_joint)
    {
        _joint->SetDampingRatio(damping);
    }
}

- (float)damping
{
    if (_joint)
    {
        return _joint->GetDampingRatio();
    }
    else
    {
        return 0;
    }
}

@end

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
#import <Box2D/Box2D.h>

@interface PHYJointDistance ()
{
    struct b2DistanceJointDef _jointDef;
    struct b2DistanceJoint *_joint;
    struct CGPoint _anchorA;
    struct CGPoint _anchorB;
}

@end

@implementation PHYJointDistance

- (id)initWithBodyA:(id)bodyA bodyB:(id)bodyB localAnchorA:(struct CGPoint)localAnchorA localAnchorB:(struct CGPoint)localAnchorB
{
    if ((self = [super init]))
    {
        self.bodyA = bodyA;
        self.bodyB = bodyB;

        if (self.bodyA.world == self.bodyB.world)
        {
            _jointDef.bodyA = self.bodyA.body;
            _jointDef.bodyB = self.bodyB.body;

            _anchorA = localAnchorA;
            _anchorB = localAnchorB;

            

            _jointDef.localAnchorA = CGPointTob2Vec2(localAnchorA);
            _jointDef.localAnchorB = CGPointTob2Vec2(localAnchorB);
            _jointDef.collideConnected = true;

            _jointDef.Initialize(self.bodyA.body, self.bodyB.body, CGPointTob2Vec2(localAnchorA), CGPointTob2Vec2(localAnchorB));

            [self.bodyA addJoint: self];
            [self.bodyB addJoint: self];
        }
    }
    return self;
}

- (id)initWithBodyA:(id)bodyA bodyB:(id)bodyB anchorA:(struct CGPoint)anchorA anchorB:(struct CGPoint)anchorB
{
    if ((self = [super init]))
    {
        self.bodyA = bodyA;
        self.bodyB = bodyB;

        if (self.bodyA.world == self.bodyB.world)
        {
            _jointDef.bodyA = self.bodyA.body;
            _jointDef.bodyB = self.bodyB.body;

            _anchorA = anchorA;
            _anchorB = anchorB;

            b2Vec2 localAnchorA = _jointDef.bodyA->GetLocalPoint(CGPointTob2Vec2(anchorA));
            b2Vec2 localAnchorB = _jointDef.bodyB->GetLocalPoint(CGPointTob2Vec2(anchorB));

            _jointDef.localAnchorA = localAnchorA;
            _jointDef.localAnchorB = localAnchorB;
            _jointDef.collideConnected = true;

            _jointDef.Initialize(self.bodyA.body, self.bodyB.body, localAnchorA, localAnchorB);

            [self.bodyA addJoint: self];
            [self.bodyB addJoint: self];
        }
    }
    return self;
}

@end

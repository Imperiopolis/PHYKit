//
//  PHYJointWeld.m
//  PHYKit
//
//  Created by Nathan Trapp on 8/4/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "PHYJointWeld.h"
#import "PHYBody.h"
#import "PHYGeometry.h"

#import <Box2D/Box2D.h>

@interface PHYJointWeld ()
{
    struct b2WeldJointDef _jointDef;
    struct b2WeldJoint *_joint;
}

@end

@implementation PHYJointWeld

- (id)initWithBodyA:(PHYBody*)bodyA bodyB:(PHYBody*)bodyB anchor:(struct CGPoint)anchor
{
    if ((self = [super init]))
    {
        self.bodyA = bodyA;
        self.bodyB = bodyB;

        if (self.bodyA.world == self.bodyB.world)
        {
            b2Vec2 anchorPoint = CGPointTob2Vec2(anchor);

            _jointDef.bodyA = self.bodyA.body;
            _jointDef.bodyB = self.bodyB.body;

            _jointDef.localAnchorA = _jointDef.bodyA->GetLocalPoint(anchorPoint);
            _jointDef.localAnchorB = _jointDef.bodyB->GetLocalPoint(anchorPoint);
            _jointDef.referenceAngle = _jointDef.bodyB->GetAngle() - _jointDef.bodyA->GetAngle();
            _jointDef.collideConnected = true;

            _jointDef.Initialize(self.bodyA.body, self.bodyB.body, anchorPoint);

            [self.bodyA addJoint: self];
            [self.bodyB addJoint: self];
        }
    }
    return self;
}

@end

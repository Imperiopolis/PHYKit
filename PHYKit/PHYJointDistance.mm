//
//  PHYJointDistance.m
//  PHYKit
//
//  Created by Nathan Trapp on 8/4/13.
//  Copyright (c) 2013 Nathan Trapp and Zev Eisenberg. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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

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

@property (strong, nonatomic) PHYBody *internalBodyB;

@end

@implementation PHYJointDistance

- (instancetype)initWithBodyA:(PHYBody*)bodyA bodyB:(PHYBody*)bodyB localAnchorA:(struct CGPoint)localAnchorA localAnchorB:(struct CGPoint)localAnchorB
{
    return [self initWithBodyA:bodyA bodyB:bodyB anchorA:localAnchorA anchorB:localAnchorB localAnchors:YES];
}

- (instancetype)initWithBodyA:(PHYBody*)bodyA bodyB:(PHYBody*)bodyB anchorA:(struct CGPoint)anchorA anchorB:(struct CGPoint)anchorB
{
    return [self initWithBodyA:bodyA bodyB:bodyB anchorA:anchorA anchorB:anchorB localAnchors:NO];
}

- (instancetype)initWithBodyA:(PHYBody *)bodyA bodyB:(PHYBody *)bodyB anchorA:(struct CGPoint)anchorA anchorB:(struct CGPoint)anchorB localAnchors:(BOOL)localAnchors
{
    if ((self = [super init]))
    {
        PHYBody *internalBodyA = bodyA;
        PHYBody *internalBodyB = bodyB;

        if (!internalBodyB)
        {
            internalBodyB = [[PHYBody alloc] initWithWorld:internalBodyA.world];
            self.internalBodyB = internalBodyB;
        }

        _jointDef.bodyA = internalBodyA.body;
        _jointDef.bodyB = internalBodyB.body;

        _anchorA = anchorA;
        _anchorB = anchorB;

        b2Vec2 internalAnchorA;
        b2Vec2 internalAnchorB;

        if ( localAnchors ) {
            internalAnchorA = _jointDef.bodyA->GetWorldPoint(CGPointTob2Vec2(anchorA));
            internalAnchorB = _jointDef.bodyB->GetWorldPoint(CGPointTob2Vec2(anchorB));

        }
        else {
            internalAnchorA = _jointDef.bodyA->GetWorldPoint(CGPointTob2Vec2(anchorA));
            internalAnchorB = _jointDef.bodyB->GetWorldPoint(CGPointTob2Vec2(anchorB));
        }

        _jointDef.localAnchorA = internalAnchorA;
        _jointDef.localAnchorB = internalAnchorB;

        _jointDef.Initialize(internalBodyA.body, internalBodyB.body, CGPointTob2Vec2(anchorA), CGPointTob2Vec2(anchorB));

        [internalBodyA addJoint: self];
        [internalBodyB addJoint: self];

        if (!bodyB)
        {
            internalBodyB.position = _anchorA;
        }

        self.bodyA = internalBodyA;
        self.bodyB = internalBodyB;
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

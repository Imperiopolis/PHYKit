//
//  PHYJointWeld.m
//  PHYKit
//
//  Created by Nora Trapp on 8/4/13.
//  Copyright (c) 2013 Nora Trapp and Zev Eisenberg. All rights reserved.
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

#import "PHYJointWeld.h"
#import "PHYBody.h"
#import "PHYGeometry.h"

#import <Box2D/Box2D.h>

@interface PHYJointWeld ()
{
    struct b2WeldJointDef _jointDef;
    b2WeldJoint *_joint;
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

//
//  PHYBody.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
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


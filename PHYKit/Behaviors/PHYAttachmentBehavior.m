//
//  PHYAttachmentBehavior.m
//  PHYKit
//
//  Created by Nora Trapp on 8/3/13.
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

#import "PHYAttachmentBehavior.h"
#import "PHYJointDistance.h"
#import "PHYJointWeld.h"
#import "PHYDynamicAnimator.h"
#import "PHYBody.h"

@interface PHYDynamicAnimator (PHYPrivateAnimator)

- (PHYBody*)bodyFromDynamicItem:(id <PHYDynamicItem>)dynamicItem;

@end

@interface PHYAttachmentBehavior ()

@property (strong) PHYJointDistance *joint;
@property (weak) id<PHYDynamicItem>item1;
@property (nonatomic) PHYOffset item1Offset;
@property (weak) id<PHYDynamicItem>item2;
@property (nonatomic) PHYOffset item2Offset;

@end

@implementation PHYAttachmentBehavior

- (instancetype)initWithItem:(id <PHYDynamicItem>)item attachedToAnchor:(CGPoint)point
{
    return [self initWithItem:item offsetFromCenter:PHYOffsetZero attachedToAnchor:point];
}

- (instancetype)initWithItem:(id <PHYDynamicItem>)item offsetFromCenter:(PHYOffset)offset attachedToAnchor:(CGPoint)point
{
    if ((self = [super init]))
    {
        self.anchorPoint = point;
        self.item1 = item;
        self.item1Offset = offset;
    }
    return self;
}

- (instancetype)initWithItem:(id <PHYDynamicItem>)item1 attachedToItem:(id <PHYDynamicItem>)item2
{
    return [self initWithItem:item1 offsetFromCenter:PHYOffsetZero attachedToItem:item2 offsetFromCenter:PHYOffsetZero];
}

- (instancetype)initWithItem:(id <PHYDynamicItem>)item1 offsetFromCenter:(PHYOffset)offset1 attachedToItem:(id <PHYDynamicItem>)item2 offsetFromCenter:(PHYOffset)offset2
{
    if ((self = [super init]))
    {
        self.item1 = item1;
        self.item2 = item2;
        self.item1Offset = offset1;
        self.item2Offset = offset2;
    }
    return self;
}

- (void)willMoveToAnimator:(PHYDynamicAnimator *__weak)animator
{
    [super willMoveToAnimator: animator];
    
    [self initializeJoints];
}

- (void)initializeJoints
{
    if (self.dynamicAnimator)
    {
        if ([self.items count] == 2)
        {
            PHYBody *bodyA = [self.dynamicAnimator bodyFromDynamicItem:self.item1];
            PHYBody *bodyB = [self.dynamicAnimator bodyFromDynamicItem:self.item2];
            
            if (self.joint)
            {
                [bodyA removeJoint: self.joint];
                [bodyB removeJoint: self.joint];
                self.joint = nil;
            }
            
            if (bodyA && bodyB)
            {
                self.joint = [[PHYJointDistance alloc] initWithBodyA:bodyA
                                                               bodyB:bodyB
                                                             anchorA:CGPointFromPHYOffset(self.item1Offset)
                                                             anchorB:CGPointFromPHYOffset(self.item2Offset)];
                self.joint.frequency = self.frequency;
                self.joint.length = self.length;
                self.joint.damping = self.damping;
            }
        }
        else if ([self.items count] == 1)
        {
            PHYBody *bodyA = [self.dynamicAnimator bodyFromDynamicItem:self.item1];
            
            if (self.joint)
            {
                [bodyA removeJoint: self.joint];
                self.joint = nil;
            }
            
            if (bodyA)
            {
                self.joint = [[PHYJointDistance alloc] initWithBodyA:bodyA
                                                               bodyB:nil
                                                             anchorA:self.anchorPoint
                                                             anchorB:CGPointZero];
                self.joint.frequency = self.frequency;
                self.joint.length = self.length;
                self.joint.damping = self.damping;
            }
        }
    }
}

- (NSArray*)items
{
    return [NSArray arrayWithObjects:self.item1, self.item2, nil];
}

- (void)setLength:(CGFloat)length
{
    _length = length;
    
    if (self.joint)
    {
        self.joint.length = length;
    }
    else if (self.dynamicAnimator)
    {
        [self initializeJoints];
    }
}

- (void)setDamping:(CGFloat)damping
{
    _damping = damping;

    if (self.joint)
    {
        self.joint.damping = damping;
    }
    else if (self.dynamicAnimator)
    {
        [self initializeJoints];
    }
}

- (void)setFrequency:(CGFloat)frequency
{
    _frequency = frequency;
    
    if (self.joint)
    {
        self.joint.frequency = frequency;
    }
    else if (self.dynamicAnimator)
    {
        [self initializeJoints];
    }
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
    _anchorPoint = anchorPoint;
    if (self.joint)
    {
        self.joint.bodyB.position = anchorPoint;
        self.joint.bodyA.resting = NO;
    }
    else if (self.dynamicAnimator)
    {
        [self initializeJoints];
    }
}

@end

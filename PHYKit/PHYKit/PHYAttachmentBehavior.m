//
//  PHYAttachmentBehavior.m
//  PHYKit
//
//  Created by Nora Trapp on 8/3/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

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
    if ((self = [super init]))
    {
        self.anchorPoint = point;
        self.item1 = item;
    }
    return self;
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
    if ((self = [super init]))
    {
        self.item1 = item1;
        self.item2 = item2;
    }
    return self;
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

- (void)willMoveToAnimator:(PHYDynamicAnimator *)animator
{
    [super willMoveToAnimator: animator];
    
    [self initializeJoints];
}

- (void)initializeJoints
{
    if (self.dynamicAnimator)
    {
        if (!self.joint)
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
                                                                 anchorA:self.anchorPoint
                                                                 anchorB:self.anchorPoint];
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
                }
            }
        }
        else
        {
            self.joint.bodyB.position = self.anchorPoint;
            self.joint.bodyA.resting = YES;
        }
    }
}

- (NSArray*)items
{
    return [NSArray arrayWithObjects:self.item1, self.item2, nil];
}

- (void)setLength:(CGFloat)length
{
    if (self.joint)
    {
        self.joint.length = length;
    }
}

- (CGFloat)length
{
    if (self.joint)
    {
        return self.joint.length;
    }
    else
    {
        return 0;
    }
}

- (void)setDamping:(CGFloat)damping
{
    if (self.joint)
    {
        self.joint.damping = damping;
    }
}

- (CGFloat)damping
{
    if (self.joint)
    {
        return self.joint.damping;
    }
    else
    {
        return 0;
    }
}

- (void)setFrequency:(CGFloat)frequency
{
    if (self.joint)
    {
        self.joint.frequency = frequency;
    }
}

- (CGFloat)frequency
{
    if (self.joint)
    {
        return self.joint.frequency;
    }
    else
    {
        return 0;
    }
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
    _anchorPoint = anchorPoint;
    [self initializeJoints];
}

@end

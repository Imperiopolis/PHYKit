//
//  PHYJoint.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//
//

#import <Foundation/NSObject.h>

@class PHYBody;

@interface PHYJoint : NSObject

@property(retain, nonatomic) PHYBody *bodyB;
@property(retain, nonatomic) PHYBody *bodyA;
@property(readonly, nonatomic) struct b2JointDef *jointDef;
@property(nonatomic) struct b2Joint *joint;

@end


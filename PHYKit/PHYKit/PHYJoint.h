//
//  PHYJoint.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//
//

#import <Foundation/NSObject.h>

@class PHYBody;

@interface PHYJoint : NSObject

@property(retain, nonatomic) PHYBody *bodyB; // @synthesize bodyB=_bodyB;
@property(retain, nonatomic) PHYBody *bodyA; // @synthesize bodyA=_bodyA;
@property(readonly, nonatomic) struct b2JointDef *jointDef;
@property(nonatomic) struct b2Joint *joint;

@end


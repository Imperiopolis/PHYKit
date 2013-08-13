//
//  PHYJointDistance.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//
//

#import "PHYJoint.h"

@interface PHYJointDistance : PHYJoint

@property(nonatomic) float frequency;
@property(nonatomic) float length;
@property(nonatomic) float damping;

- (id)initWithBodyA:(PHYBody*)bodyA bodyB:(PHYBody*)bodyB localAnchorA:(struct CGPoint)localAnchorA localAnchorB:(struct CGPoint)localAnchorB;
- (id)initWithBodyA:(PHYBody*)bodyA bodyB:(PHYBody*)bodyB anchorA:(struct CGPoint)anchorA anchorB:(struct CGPoint)anchorB;

@end


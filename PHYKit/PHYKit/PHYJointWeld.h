//
//  PHYJointWeld.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//
//

#import "PHYJoint.h"

@interface PHYJointWeld : PHYJoint

@property (nonatomic) CGPoint anchor;

- (id)initWithBodyA:(PHYBody*)bodyA bodyB:(PHYBody*)bodyB anchor:(struct CGPoint)anchor;

@end


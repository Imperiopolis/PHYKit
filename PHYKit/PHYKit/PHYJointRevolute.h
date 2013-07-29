//
//  PHYJointRevolute.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//
//

#import <PhysicsKit/PHYJoint.h>

@interface PHYJointRevolute : PHYJoint
{
    struct b2RevoluteJointDef _jointDef;
    struct b2RevoluteJoint *_joint;
    struct CGPoint _anchor;
}

+ (id)jointWithBodyA:(id)arg1 bodyB:(id)arg2 anchor:(struct CGPoint)arg3;
- (id).cxx_construct;
- (void)create;
- (struct b2JointDef *)_jointDef;
- (void)set_joint:(struct b2Joint *)arg1;
- (struct b2Joint *)_joint;
@property(nonatomic) float frictionTorque;
@property(nonatomic) float upperAngleLimit;
@property(nonatomic) float lowerAngleLimit;
@property(nonatomic) BOOL shouldEnableLimits;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithBodyA:(id)arg1 bodyB:(id)arg2 anchor:(struct CGPoint)arg3;

@end


//
//  PHYJointRope.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//
//

#import <PhysicsKit/PHYJoint.h>

@interface PHYJointRope : PHYJoint
{
    struct b2RopeJointDef _jointDef;
    struct b2RopeJoint *_joint;
    struct CGPoint _anchorA;
    struct CGPoint _anchorB;
}

+ (id)jointWithBodyA:(id)arg1 bodyB:(id)arg2 anchorA:(struct CGPoint)arg3 anchorB:(struct CGPoint)arg4;
- (id).cxx_construct;
- (void)create;
- (struct b2JointDef *)_jointDef;
- (void)set_joint:(struct b2Joint *)arg1;
- (struct b2Joint *)_joint;
@property(nonatomic) float maxLength;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithBodyA:(id)arg1 bodyB:(id)arg2 anchorA:(struct CGPoint)arg3 anchorB:(struct CGPoint)arg4;

@end


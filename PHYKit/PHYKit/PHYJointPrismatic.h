//
//  PHYJointPrismatic.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//
//

#import <PhysicsKit/PHYJoint.h>

@interface PHYJointPrismatic : PHYJoint
{
    struct b2PrismaticJointDef _jointDef;
    struct b2PrismaticJoint *_joint;
    struct CGPoint _anchor;
    struct CGPoint _axis;
}

+ (id)jointWithBodyA:(id)arg1 bodyB:(id)arg2 anchor:(struct CGPoint)arg3 axis:(struct CGPoint)arg4;
- (id).cxx_construct;
- (void)create;
- (struct b2JointDef *)_jointDef;
- (void)set_joint:(struct b2Joint *)arg1;
- (struct b2Joint *)_joint;
@property(nonatomic) float upperDistanceLimit;
@property(nonatomic) float lowerDistanceLimit;
@property(nonatomic) BOOL shouldEnableLimits;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithBodyA:(id)arg1 bodyB:(id)arg2 anchor:(struct CGPoint)arg3 axis:(struct CGPoint)arg4;

@end


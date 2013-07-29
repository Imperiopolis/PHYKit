//
//  PHYJoint.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//
//

#import <Foundation/NSObject.h>

@class PHYBody;

@interface PHYJoint : NSObject <NSCoding>
{
    BOOL _inUse;
    PHYBody *_bodyA;
    PHYBody *_bodyB;
}

@property(retain, nonatomic) PHYBody *bodyB; // @synthesize bodyB=_bodyB;
@property(retain, nonatomic) PHYBody *bodyA; // @synthesize bodyA=_bodyA;
- (void).cxx_destruct;
- (id)init;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (void)create;
@property(readonly, nonatomic) struct b2JointDef *_jointDef;
- (void)set_inUse:(BOOL)arg1;
- (BOOL)_inUse;
@property(nonatomic) struct b2Joint *_joint;

@end


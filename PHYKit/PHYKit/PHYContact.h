//
//  PHYContact.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//
//

#import <Foundation/NSObject.h>
@class PHYBody;

@interface PHYContact : NSObject
{
    PHYBody *_bodyA;
    PHYBody *_bodyB;
    struct CGPoint _contactPoint;
    float _impulse;
    BOOL _didBegin;
    BOOL _didEnd;
}

- (id).cxx_construct;
- (void).cxx_destruct;
@property(readonly, nonatomic) float collisionImpulse;
@property(readonly, nonatomic) struct CGPoint contactPoint;
@property(readonly, nonatomic) PHYBody *bodyB;
@property(readonly, nonatomic) PHYBody *bodyA;
- (void)setCollisionImpulse:(float)arg1;
- (void)setBodyB:(id)arg1;
- (void)setBodyA:(id)arg1;
- (void)setContactPoint:(struct CGPoint)arg1;
@property BOOL didEnd;
@property BOOL didBegin;
- (id)init;

@end


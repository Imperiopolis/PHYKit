
//
//  PHYWorld.m
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import "PHYGeometry.h"
#import "PHYWorld.h"
#import "PHYDynamicBehavior.h"
#import "PHYBody.h"

#import <Box2D/Box2D.h>

@interface PHYWorld ()
{
    b2World *_b2world;
    NSMutableSet *_bodies;
}

@end

@implementation PHYWorld

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        b2Vec2 gravity;
        gravity.SetZero();
        _b2world = new b2World(gravity);
        
        _b2world->SetContinuousPhysics(true);
        
        _bodies = [NSMutableSet set];
    }
    
    return self;
}

- (void)dealloc
{
    delete _b2world;
    _b2world = nil;
}

- (void)stepWithTime:(NSTimeInterval)timeInterval
{
    // step with default iterations
    [self stepWithTime:timeInterval velocityIterations:8 positionIterations:1];
}

- (void)stepWithTime:(NSTimeInterval)timeInterval velocityIterations:(NSUInteger)velocityIterations positionIterations:(NSUInteger)positionIterations
{
    _b2world->Step(timeInterval, (int32)velocityIterations, (int32)positionIterations);
    
    //Iterate over the bodies in the physics world
	for (PHYBody *body in _bodies)
	{
		if (body.dynamicItem)
		{
			// y Position subtracted because of flipped coordinate system
			CGPoint newCenter = CGPointMake(body.body->GetPosition().x * kPointsToMeterRatio,
                                            body.body->GetPosition().y * kPointsToMeterRatio);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                body.dynamicItem.center = newCenter;
            });

#warning make sure the minus sign is supposed to be there, and look here if we are getting backwards rotations
			CGAffineTransform transform = CGAffineTransformMakeRotation(- body.body->GetAngle());
            
			body.dynamicItem.transform = transform;
		}
	}

}


- (void)removeAllBodies
{
    [_bodies removeAllObjects];
}

- (void)removeBody:(PHYBody*)body
{
    [_bodies removeObject: body];
}

- (void)addBody:(PHYBody*)body
{
    body.world = self;
    body.dynamic = YES;
    body.density = 3.0f;
    body.friction = 0.3f;
    body.restitution = 0.5f; // 0 is a lead ball, 1 is a super bouncy ball

    [_bodies addObject: body];
}

- (NSArray *)bodies
{
    return [_bodies allObjects];
}

- (BOOL)hasBodies
{
    return [_bodies count] != 0;
}


- (id)bodyAlongRayStart:(struct CGPoint)startPoint end:(struct CGPoint)endPoint
{
    return nil;
}

- (id)bodyInRect:(struct CGRect)rect
{
    return nil;
}

- (id)bodyAtPoint:(struct CGPoint)point
{
    return nil;
}

- (void)enumerateBodiesAlongRayStart:(struct CGPoint)startPoint end:(struct CGPoint)endPoint usingBlock:(PHYWorldBlock)block
{
    
}

- (void)enumerateBodiesInRect:(struct CGRect)rect usingBlock:(PHYWorldBlock)block
{
    
}

- (void)enumerateBodiesAtPoint:(struct CGPoint)point usingBlock:(PHYWorldBlock)block
{
    
}

- (CGPoint)gravity
{
    return b2Vec2ToCGPoint(_b2world->GetGravity());
}

- (void)setGravity:(struct CGPoint)gravity
{
    _b2world->SetGravity(CGPointTob2Vec2(gravity));
}

- (b2World*)_world
{
    return _b2world;
}

@end

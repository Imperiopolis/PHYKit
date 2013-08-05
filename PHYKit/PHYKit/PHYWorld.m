
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

@property (weak) NSView *referenceView;

@end

@implementation PHYWorld

- (instancetype)initWithReferenceView:(NSView*)referenceView
{
    self = [super init];
    if (self)
    {
        self.referenceView = referenceView;

        b2Vec2 gravity;
        gravity.SetZero();
        _b2world = new b2World(gravity);
        
        _b2world->SetContinuousPhysics(true);
        
        _bodies = [NSMutableSet set];

        // Define the ground body.
        b2BodyDef groundBodyDef;
        groundBodyDef.position.Set(0, 0); // bottom-left corner

        // Call the body factory which allocates memory for the ground body
        // from a pool and creates the ground box shape (also from a pool).
        // The body is also added to the world.
        b2Body* groundBody = _b2world->CreateBody(&groundBodyDef);

        // Define the ground box shape.
        b2EdgeShape groundBox;
        
        // bottom
        b2FixtureDef botFixtureDef;
        botFixtureDef.filter.maskBits = PHYReferenceCollisions;

        groundBox.Set(b2Vec2(0,0), b2Vec2(CGRectGetWidth(self.referenceView.bounds) / kPointsToMeterRatio, 0));
        // Define the dynamic body fixture.
        botFixtureDef.shape = &groundBox;
        groundBody->CreateFixture(&botFixtureDef);

        // top
        b2FixtureDef topFixtureDef;
        botFixtureDef.filter.maskBits = PHYReferenceCollisions;

        groundBox.Set(b2Vec2(0, CGRectGetHeight(self.referenceView.bounds) / kPointsToMeterRatio), b2Vec2(CGRectGetWidth(self.referenceView.bounds) / kPointsToMeterRatio, CGRectGetHeight(self.referenceView.bounds) / kPointsToMeterRatio));
        topFixtureDef.shape = &groundBox;
        groundBody->CreateFixture(&topFixtureDef);

        // left
        b2FixtureDef leftFixtureDef;
        botFixtureDef.filter.maskBits = PHYReferenceCollisions;

        groundBox.Set(b2Vec2(0, CGRectGetHeight(self.referenceView.bounds) / kPointsToMeterRatio), b2Vec2(0, 0));
        leftFixtureDef.shape = &groundBox;
        groundBody->CreateFixture(&leftFixtureDef);

        // right
        b2FixtureDef rightFixtureDef;
        botFixtureDef.filter.maskBits = PHYReferenceCollisions;

        groundBox.Set(b2Vec2(CGRectGetWidth(self.referenceView.bounds) / kPointsToMeterRatio, CGRectGetHeight(self.referenceView.bounds) / kPointsToMeterRatio), b2Vec2(CGRectGetWidth(self.referenceView.bounds) / kPointsToMeterRatio, 0));
        rightFixtureDef.shape = &groundBox;
        groundBody->CreateFixture(&rightFixtureDef);
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
    @synchronized(_bodies)
    {
        for (PHYBody *body in _bodies)
        {
            if (body.dynamicItem)
            {
                // y Position subtracted because of flipped coordinate system
                CGPoint newCenter = CGPointMake(body.body->GetPosition().x * kPointsToMeterRatio,
                                                body.body->GetPosition().y * kPointsToMeterRatio);

#warning make sure the minus sign is supposed to be there, and look here if we are getting backwards rotations
                CGAffineTransform transform = CGAffineTransformMakeRotation(- body.body->GetAngle());

                dispatch_async(dispatch_get_main_queue(), ^{
                    body.dynamicItem.center = newCenter;
                    body.dynamicItem.transform = transform;
                });

                
            }
        }
    }
}


- (void)removeAllBodies
{
    @synchronized(_bodies)
    {
        [_bodies removeAllObjects];
    }
}

- (void)removeBody:(PHYBody*)body
{
    @synchronized(_bodies)
    {
        [_bodies removeObject: body];
    }
}

- (void)addBody:(PHYBody*)body
{
    body.world = self;
    body.dynamic = YES;

    @synchronized(_bodies)
    {
        [_bodies addObject: body];
    }
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

- (b2World*)b2world
{
    return _b2world;
}

@end

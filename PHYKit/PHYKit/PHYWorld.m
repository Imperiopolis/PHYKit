//
//  PHYWorld.m
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import <PHYWorld.h>
#import <Box2D/Box2D.h>
#import "PHYDynamicBehavior.h"

#define kPixelToMeterRatio 16

@interface PHYWorld ()
{
    b2World *_b2world;
}

@property (strong, nonatomic) NSMutableArray *mutableBodies;

@end

@implementation PHYWorld

+ (instancetype)world
{
    return [[PHYWorld alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        b2Vec2 gravity;
        gravity.SetZero();
        _b2world = new b2World(gravity);
        
        _b2world->SetContinuousPhysics(true);
        
        self.mutableBodies = [NSMutableArray array];
    }
    
    return self;
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
	for (b2Body* b = _b2world->GetBodyList(); b; b = b->GetNext())
	{
		if (b->GetUserData() != NULL)
		{
			id<PHYDynamicItem> dynamicItem = (__bridge id<PHYDynamicItem>)b->GetUserData();
            
			// y Position subtracted because of flipped coordinate system
			CGPoint newCenter = CGPointMake(b->GetPosition().x * kPixelToMeterRatio,
                                            b->GetPosition().y * kPixelToMeterRatio);
			dynamicItem.center = newCenter;
            
#warning make sure the minus sign is supposed to be there, and look here if we are getting backwards rotations
			CGAffineTransform transform = CGAffineTransformMakeRotation(- b->GetAngle());
            
			dynamicItem.transform = transform;
		}
	}

}


- (void)removeAllBodies
{
    for (b2Body* body = _b2world->GetBodyList(); body; body = body->GetNext())
	{
        _b2world->DestroyBody(body);
	}
    
    [self.mutableBodies removeAllObjects];
}

- (void)removeBody:(id<PHYDynamicItem>)dynamicItem
{
#warning need a mapping table so we can look up a b2body, given a dynamic item
}

- (void)addBody:(id<PHYDynamicItem>)dynamicItem
{
    // Define the dynamic body.
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	CGPoint p = dynamicItem.center;
	CGSize boxSize = CGSizeMake(dynamicItem.bounds.size.width / kPixelToMeterRatio / 2.0,
                                dynamicItem.bounds.size.height / kPixelToMeterRatio / 2.0);
    
	bodyDef.position.Set(p.x / kPixelToMeterRatio,
                         p.y / kPixelToMeterRatio);
    
	bodyDef.userData = (__bridge void *)dynamicItem;
    
	// Tell the physics world to create the body
	b2Body *body = _b2world->CreateBody(&bodyDef);
    
	// Define another box shape for our dynamic body.
	b2PolygonShape dynamicBox;
    
	dynamicBox.SetAsBox(boxSize.width, boxSize.height);
    
	// Define the dynamic body fixture.
	b2FixtureDef fixtureDef;
	fixtureDef.shape = &dynamicBox;
	fixtureDef.density = 3.0f;
	fixtureDef.friction = 0.3f;
	fixtureDef.restitution = 0.5f; // 0 is a lead ball, 1 is a super bouncy ball
	body->CreateFixture(&fixtureDef);
    
	// a dynamic body reacts to forces right away
	body->SetType(b2_dynamicBody);
    
    [self.mutableBodies addObject:dynamicItem];
}

- (NSArray *)bodies
{
    return [NSArray arrayWithArray:self.mutableBodies];
}

- (BOOL)hasBodies
{
    return [self.bodies count] != 0;
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



@end
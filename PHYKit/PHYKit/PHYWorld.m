
//
//  PHYWorld.m
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import <PHYWorld.h>
#import <Box2D/Box2D.h>
#import "PHYDynamicBehavior.h"
#import "PHYGeometry.h"

@interface PHYWorld ()
{
    b2World *_b2world;
}

@property (strong, nonatomic) NSMutableDictionary *bodyMap;

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
        
        self.bodyMap = [NSMutableDictionary dictionary];
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
	for (id<PHYDynamicItem> dynamicItem in self.bodies)
	{
        b2Body *b = [self b2BodyFromDynamicItem: dynamicItem];
        
		if (b->GetUserData() != NULL)
		{
			// y Position subtracted because of flipped coordinate system
			CGPoint newCenter = CGPointMake(b->GetPosition().x * kPointsToMeterRatio,
                                            b->GetPosition().y * kPointsToMeterRatio);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                dynamicItem.center = newCenter;
            });

#warning make sure the minus sign is supposed to be there, and look here if we are getting backwards rotations
			CGAffineTransform transform = CGAffineTransformMakeRotation(- b->GetAngle());
            
			dynamicItem.transform = transform;
		}
	}

}


- (void)removeAllBodies
{
    for (id<PHYDynamicItem> dynamicItem in self.bodies)
    {
        b2Body *body = [self b2BodyFromDynamicItem: dynamicItem];

        _b2world->DestroyBody(body);
    }
    
    [self.bodyMap removeAllObjects];
}

- (void)removeBody:(id<PHYDynamicItem>)dynamicItem
{
    b2Body *body = [self b2BodyFromDynamicItem: dynamicItem];

    _b2world->DestroyBody(body);

    //[self.bodyMap removeObjectForKey:[NSValue valueWithNonretainedObject:dynamicItem]];
}

- (void)addBody:(id<PHYDynamicItem>)dynamicItem
{
    // Define the dynamic body.
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	CGPoint p = dynamicItem.center;
	CGSize boxSize = CGSizeMake(dynamicItem.bounds.size.width / kPointsToMeterRatio / 2.0,
                                dynamicItem.bounds.size.height / kPointsToMeterRatio / 2.0);
    
	bodyDef.position.Set(p.x / kPointsToMeterRatio,
                         p.y / kPointsToMeterRatio);
    
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
    
    [self.bodyMap setObject:[NSValue valueWithPointer:body] forKey:[NSValue valueWithNonretainedObject:dynamicItem]];
}

- (NSArray *)bodies
{
    NSMutableArray *bodies = [NSMutableArray array];

    for (NSValue *value in [[self.bodyMap allKeys] copy])
    {
        id <PHYDynamicItem>dynamicItem = [value nonretainedObjectValue];

        if (dynamicItem)
        {
            [bodies addObject: dynamicItem];
        }
        else
        {
            [self.bodyMap removeObjectForKey: value];
        }
    }
    
    return [bodies copy];
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

- (CGPoint)gravity
{
    return b2Vec2ToCGPoint(_b2world->GetGravity());
}

- (void)setGravity:(struct CGPoint)gravity
{
    _b2world->SetGravity(CGPointTob2Vec2(gravity));
}

- (b2Body *)b2BodyFromDynamicItem:(id <PHYDynamicItem>)dynamicItem
{
    return (b2Body*)[[self.bodyMap objectForKey:[NSValue valueWithNonretainedObject:dynamicItem]] pointerValue];
}

@end

//
//  ViewController.m
//  UIKitPhysics
//
//  Created by Zev Eisenberg on 7/12/13.
//  Copyright (c) 2013 Zev Eisenberg. All rights reserved.
//

#import "ViewController.h"
#import <Box2D/Box2D.h>

#define PTM_RATIO 16

@interface ViewController ()
{
    b2World* world;
	NSTimer *tickTimer;
}

@end

@implementation ViewController

- (void)dealloc
{
    [tickTimer invalidate], tickTimer = nil;
}

-(void)createPhysicsWorld
{
	CGSize screenSize = self.view.bounds.size;
    
	// Define the gravity vector.
	b2Vec2 gravity;
	gravity.Set(0.0f, -9.81f);
    
	// Construct a world object, which will hold and simulate the rigid bodies.
	world = new b2World(gravity);
    
	world->SetContinuousPhysics(true);
    
	// Define the ground body.
	b2BodyDef groundBodyDef;
	groundBodyDef.position.Set(0, 0); // bottom-left corner
    
	// Call the body factory which allocates memory for the ground body
	// from a pool and creates the ground box shape (also from a pool).
	// The body is also added to the world.
	b2Body* groundBody = world->CreateBody(&groundBodyDef);
    
	// Define the ground box shape.
	b2EdgeShape groundBox;
    
	// bottom
	groundBox.Set(b2Vec2(0,0), b2Vec2(screenSize.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox, 0);
    
	// top
	groundBox.Set(b2Vec2(0,screenSize.height/PTM_RATIO), b2Vec2(screenSize.width/PTM_RATIO,screenSize.height/PTM_RATIO));
	groundBody->CreateFixture(&groundBox, 0);
    
	// left
	groundBox.Set(b2Vec2(0,screenSize.height/PTM_RATIO), b2Vec2(0,0));
	groundBody->CreateFixture(&groundBox, 0);
    
	// right
	groundBox.Set(b2Vec2(screenSize.width/PTM_RATIO,screenSize.height/PTM_RATIO), b2Vec2(screenSize.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox, 0);
}

-(void)addPhysicalBodyForView:(UIView *)physicalView
{
	// Define the dynamic body.
	b2BodyDef bodyDef;
	bodyDef.type = b2_dynamicBody;
    
	CGPoint p = physicalView.center;
	CGSize boxSize = CGSizeMake(physicalView.bounds.size.width / PTM_RATIO / 2.0,
                                        physicalView.bounds.size.height / PTM_RATIO / 2.0);
    
	bodyDef.position.Set(p.x / PTM_RATIO, (460.0 - p.y) / PTM_RATIO);
	bodyDef.userData = (__bridge void *)physicalView;
    
	// Tell the physics world to create the body
	b2Body *body = world->CreateBody(&bodyDef);
    
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
    
	// we abuse the tag property as pointer to the physical body
//	physicalView.tag = (int)body;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
	[self createPhysicsWorld];
    
	for (UIView *oneView in self.view.subviews)
	{
		[self addPhysicalBodyForView:oneView];
	}
    
	tickTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 200)];
        view.backgroundColor = [UIColor redColor];
        view.alpha = 0;
        [self.view addSubview:view];
        [UIView animateWithDuration:0.5 animations:^{
            view.alpha = 1.0;
        } completion:^(BOOL finished) {
            [self addPhysicalBodyForView:view];
        }];
    });
}

-(void) tick:(NSTimer *)timer
{
	//It is recommended that a fixed time step is used with Box2D for stability
	//of the simulation, however, we are using a variable time step here.
	//You need to make an informed choice, the following URL is useful
	//http://gafferongames.com/game-physics/fix-your-timestep/
    
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
    
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	world->Step(1.0f/60.0f, velocityIterations, positionIterations);
    
	//Iterate over the bodies in the physics world
	for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
	{
		if (b->GetUserData() != NULL)
		{
			UIView *oneView = (__bridge UIView *)b->GetUserData();
            
			// y Position subtracted because of flipped coordinate system
			CGPoint newCenter = CGPointMake(b->GetPosition().x * PTM_RATIO,
                                            self.view.bounds.size.height - b->GetPosition().y * PTM_RATIO);
			oneView.center = newCenter;
            
			CGAffineTransform transform = CGAffineTransformMakeRotation(- b->GetAngle());
            
			oneView.transform = transform;
		}
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  PHYGeometry.h
//  PHYKit
//
//  Created by Nathan Trapp on 8/1/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

static const CGFloat kPointsToMeterRatio = 32;

float32 PointsToMeters(CGFloat points)
{
    return points / kPointsToMeterRatio;
}

CGFloat MetersToPoints(float32 meters)
{
    return meters * kPointsToMeterRatio;
}

b2Vec2 CGPointTob2Vec2(CGPoint point)
{
    float32 x = PointsToMeters(point.x);
    float32 y = PointsToMeters(point.y);
    return b2Vec2(x, y);
}

CGPoint b2Vec2ToCGPoint(b2Vec2 vector)
{
    CGFloat x = MetersToPoints(vector.x);
    CGFloat y = MetersToPoints(vector.y);
    return CGPointMake(x, y);
}
//
//  PHYGeometry.h
//  PHYKit
//
//  Created by Nora Trapp on 8/1/13.
//  Copyright (c) 2013 Nora Trapp. All rights reserved.
//

#import <Box2D/Common/b2Math.h>

#define kPointsToMeterRatio     (32)

#define PointsToMeters(points)  (points / kPointsToMeterRatio)
#define MetersToPoints(meters)  (meters * kPointsToMeterRatio)
#define CGPointTob2Vec2(point)  (b2Vec2(PointsToMeters(point.x), PointsToMeters(point.y)))
#define b2Vec2ToCGPoint(vector) (CGPointMake(MetersToPoints(vector.x), MetersToPoints(vector.y)))

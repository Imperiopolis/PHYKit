//
//  PHYWorld.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//  Copyright (c) 2013 Nora Trapp and Zev Eisenberg. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

typedef NS_OPTIONS(NSInteger, PHYCollisionCategory)
{
    PHYNoCollisions =           0,
    PHYReferenceCollisions =    1 << 0,
    PHYBoundaryCollisions =     1 << 1,
    PHYItemsCollisions  =       1 << 2
};

typedef void(^PHYWorldBlock)(void);

@class PHYBody;
@protocol PHYDynamicItem;

@interface PHYWorld : NSObject

@property (nonatomic) struct CGPoint gravity;
@property (nonatomic, readonly) NSArray *bodies;

- (instancetype)initWithReferenceView:(NSView*)referenceView;

- (void)stepWithTime:(NSTimeInterval)timeInterval;
- (void)stepWithTime:(NSTimeInterval)timeInterval velocityIterations:(NSUInteger)velocityIterations positionIterations:(NSUInteger)positionIterations;

- (void)removeAllBodies;
- (void)removeBody:(PHYBody*)body;
- (void)addBody:(PHYBody*)body;
- (BOOL)hasBodies;

- (id)bodyAlongRayStart:(struct CGPoint)startPoint end:(struct CGPoint)endPoint;
- (id)bodyInRect:(struct CGRect)rect;
- (id)bodyAtPoint:(struct CGPoint)point;
- (void)enumerateBodiesAlongRayStart:(struct CGPoint)startPoint end:(struct CGPoint)endPoint usingBlock:(PHYWorldBlock)block;
- (void)enumerateBodiesInRect:(struct CGRect)rect usingBlock:(PHYWorldBlock)block;
- (void)enumerateBodiesAtPoint:(struct CGPoint)point usingBlock:(PHYWorldBlock)block;

@end


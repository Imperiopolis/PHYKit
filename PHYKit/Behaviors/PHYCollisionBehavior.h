//
//  PHYDynamicCollisionBehavior.h
//  PHYKit
//
//  Created by Nathan Trapp on 6/29/13.
//  Copyright (c) 2013 Nathan Trapp and Zev Eisenberg. All rights reserved.
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

#import "PHYDynamicBehavior.h"

@class PHYCollisionBehavior;

typedef NS_OPTIONS(NSUInteger, PHYCollisionBehaviorMode)
{
    PHYCollisionBehaviorModeItems        = 1 << 0,
    PHYCollisionBehaviorModeBoundaries   = 1 << 1,
    PHYCollisionBehaviorModeEverything   = NSUIntegerMax
};

@protocol PHYCollisionBehaviorDelegate <NSObject>
@optional

- (void)collisionBehavior:(PHYCollisionBehavior*)behavior beganContactForItem:(id <PHYDynamicItem>)item1 withItem:(id <PHYDynamicItem>)item2 atPoint:(CGPoint)p;
- (void)collisionBehavior:(PHYCollisionBehavior*)behavior endedContactForItem:(id <PHYDynamicItem>)item1 withItem:(id <PHYDynamicItem>)item2;

// The identifier of a boundary created with translatesReferenceBoundsIntoBoundary or setTranslatesReferenceBoundsIntoBoundaryWithInsets is nil
- (void)collisionBehavior:(PHYCollisionBehavior*)behavior beganContactForItem:(id <PHYDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier atPoint:(CGPoint)p;
- (void)collisionBehavior:(PHYCollisionBehavior*)behavior endedContactForItem:(id <PHYDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier;

@end

@interface PHYCollisionBehavior : PHYDynamicBehavior

- (instancetype)initWithItems:(NSArray *)items;

- (void)addItem:(id <PHYDynamicItem>)item;
- (void)removeItem:(id <PHYDynamicItem>)item;

- (void)setTranslatesReferenceBoundsIntoBoundaryWithInsets:(NSEdgeInsets)insets;
- (void)addBoundaryWithIdentifier:(id <NSCopying>)identifier forPath:(NSBezierPath*)bezierPath;
- (void)addBoundaryWithIdentifier:(id <NSCopying>)identifier fromPoint:(CGPoint)p1 toPoint:(CGPoint)p2;
- (NSBezierPath*)boundaryWithIdentifier:(id <NSCopying>)identifier;
- (void)removeBoundaryWithIdentifier:(id <NSCopying>)identifier;
- (void)removeAllBoundaries;

@property (nonatomic, readwrite) PHYCollisionBehaviorMode collisionMode;
@property (nonatomic, readwrite) BOOL translatesReferenceBoundsIntoBoundary;
@property (nonatomic, readonly, copy) NSArray* boundaryIdentifiers;
@property (nonatomic, weak) id <PHYCollisionBehaviorDelegate> collisionDelegate;

@end

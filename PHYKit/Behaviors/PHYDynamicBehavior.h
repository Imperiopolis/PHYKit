//
//  PHYDynamicBehavior.h
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
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

#import <Foundation/Foundation.h>

typedef struct PHYOffset
{
    CGFloat horizontal, vertical; // specify amount to offset a position, positive for right or down, negative for left or up
} PHYOffset;

static inline PHYOffset PHYOffsetMake(CGFloat horizontal, CGFloat vertical)
{
    PHYOffset offset = {horizontal, vertical};
    return offset;
}

#define PHYOffsetZero                   (PHYOffsetMake(0, 0))
#define CGPointFromPHYOffset(offset)    (CGPointMake(offset.horizontal, offset.vertical))


@protocol PHYDynamicItem <NSObject>

@property (nonatomic, readwrite) CGPoint center;
@property (nonatomic, readonly) CGRect bounds;
@property (nonatomic, readwrite) CGAffineTransform transform;

@end

@class PHYDynamicAnimator;

@interface PHYDynamicBehavior : NSObject

- (void)addChildBehavior:(PHYDynamicBehavior *)behavior;
- (void)removeChildBehavior:(PHYDynamicBehavior *)behavior;

- (void)willMoveToAnimator:(PHYDynamicAnimator *__weak)animator; // nil when being removed from an animator

@property (nonatomic, readonly, copy) NSArray *childBehaviors;
@property (nonatomic, readonly, weak) PHYDynamicAnimator *dynamicAnimator;
@property (nonatomic, readonly, copy) NSArray* items;

@property (nonatomic, copy) void (^action)(void);

@end

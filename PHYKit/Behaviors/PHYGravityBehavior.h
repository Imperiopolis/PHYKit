//
//  PHYDynamicGravityBehavior.h
//  PHYKit
//
//  Created by Nora Trapp on 6/28/13.
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

#import "PHYDynamicBehavior.h"

@interface PHYGravityBehavior : PHYDynamicBehavior

- (instancetype)initWithItems:(NSArray *)items;

- (void)addItem:(id <PHYDynamicItem>)item;
- (void)removeItem:(id <PHYDynamicItem>)item;
- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude;

// The default value for the gravity vector is (0.0, 1.0)
// The acceleration for a dynamic item subject to a (0.0, 1.0) gravity vector is downwards at 1000 points per second².
@property (readwrite, nonatomic) CGSize gravityDirection;

@property (readwrite, nonatomic) CGFloat angle;
@property (readwrite, nonatomic) CGFloat magnitude;

@end

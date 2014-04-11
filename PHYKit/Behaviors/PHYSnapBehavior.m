//
//  PHYSnapBehavior.m
//  PHYKit
//
//  Created by Zev Eisenberg on 7/9/13.
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

#import "PHYSnapBehavior.h"
#import "PHYDynamicAnimator.h"
#import "PHYBody.h"

@interface PHYDynamicAnimator (PHYPrivateAnimator)

- (PHYBody*)bodyFromDynamicItem:(id <PHYDynamicItem>)dynamicItem;

@end

@interface PHYSnapBehavior ()
{
    NSMutableSet *_items;
    void (^_action)(void);
}

@property (assign) CGPoint point;
@property (nonatomic, copy) void (^internalAction)(void);

@end

@implementation PHYSnapBehavior

- (instancetype)initWithItem:(id <PHYDynamicItem>)item snapToPoint:(CGPoint)point
{
    self = [super init];
    if (self)
    {
        _items = [NSMutableSet setWithObject: item];
        self.damping = 0.5;
        self.point = point;
    }
    return self;
}

- (NSArray*)items
{
    return [_items allObjects];
}

- (void (^)(void))action
{
    __weak typeof(_internalAction) internalAction = _internalAction;
    __weak typeof(_action) action = _action;

    return ^{
        if (internalAction) internalAction();
        if (action) action();
    };
}

- (void)willMoveToAnimator:(PHYDynamicAnimator *)animator
{
    [super willMoveToAnimator: animator];

    if (animator)
    {
        PHYBody *body = [animator bodyFromDynamicItem: [self.items lastObject]];
        __weak typeof(self) weakSelf = self;
        
        if (body)
        {
            self.internalAction = ^{
                body.linearDamping = weakSelf.damping;
                body.velocity = CGPointMake((weakSelf.point.x - body.position.x) * 5, (weakSelf.point.y - body.position.y) * 5);
                
                if (ceil(body.position.x) == ceil(weakSelf.point.x) && ceil(body.position.y) == ceil(weakSelf.point.y))
                {
                    body.velocity = CGPointMake(0, 0);
                }
            };
        }
    }
}

@end

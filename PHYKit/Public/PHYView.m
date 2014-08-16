//
//  PHYView.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/19/13.
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

#import "PHYView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PHYView

// For the PHYDyanmicItem Protocol

// NSView already implements bounds, but the protocol made me do it
- (void)setBounds:(NSRect)aRect
{
    [super setBounds:aRect];
    [self.layer setBounds:aRect];
}

- (NSRect)bounds
{
    return _bounds;
}

// flip coordinates when loading a xib
// see: http://lists.apple.com/archives/xcode-users/2009/Jan/msg00005.html
- (void)awakeFromNib {
    for(NSView *view in [self subviews]) {
        NSRect frame = [view frame];
        frame.origin.y = NSMaxY([self bounds]) - NSMaxY([view frame]);
        [view setFrame:frame];
    }
}

// animations

+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animationBlock
{
    [self animateWithDuration:duration animations:animationBlock completion:nil];
}

+ (void)animateWithDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animationBlock
                 completion:(void (^)(void))completionBlock
{
    if (animationBlock)
    {
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
            [context setDuration:duration];
            animationBlock();
        } completionHandler:completionBlock];
    }
}

// Call PHYView initWithFrame instead of super
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setupLayer];
    }
    
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:NSZeroRect];
}

- (instancetype)initWithFrame:(NSRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self setupLayer];
    }
    
    return self;
}

- (void)setupLayer
{
    self.layer = [CALayer layer];
    [self setWantsLayer:YES];
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    self.layer.backgroundColor = backgroundColor.CGColor;
}

- (NSColor*)backgroundColor
{
    return [NSColor colorWithCGColor:self.layer.backgroundColor];
}

- (void)setTransform:(CGAffineTransform)transform
{
    self.layer.transform = CATransform3DMakeAffineTransform(transform);
}

- (CGAffineTransform)transform
{
    return CATransform3DGetAffineTransform(self.layer.transform);
}

- (void)setCenter:(CGPoint)center
{
    NSRect frame = self.frame;
    frame.origin = NSMakePoint(center.x - NSWidth(frame) / 2,
                               center.y - NSHeight(frame) / 2);
    [self setFrame:frame];
}

- (CGPoint)center
{
    NSRect frame = self.frame;
    return CGPointMake(NSWidth(frame) / 2 + frame.origin.x,
                       NSHeight(frame) / 2 + frame.origin.y);
}

- (void)setAlpha:(CGFloat)alpha
{
    [self setAlphaValue: alpha];
}

- (CGFloat)alpha
{
    return [self alphaValue];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; frame = %@; layer = %@>", [self className], self, NSStringFromRect(NSRectFromCGRect(self.frame)), self.layer];
}

// use a flipped coordinate system like UIView
- (BOOL)isFlipped
{
    return YES;
}

- (void)mouseDown:(NSEvent *)theEvent
{
    if ([self.delegate respondsToSelector:@selector(viewClicked:)])
    {
        [self.delegate viewClicked: theEvent];
    }
}

- (void)mouseDragged:(NSEvent*)theEvent
{
    if ([self.delegate respondsToSelector:@selector(viewDragged:)])
    {
        [self.delegate viewDragged: theEvent];
    }
}

@end

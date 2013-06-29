//
//  PHYView.m
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import "PHYView.h"
#import <QuartzCore/QuartzCore.h>

@interface PHYView ()
@end

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

- (void)setFrame:(NSRect)frameRect
{
    [super setFrame:frameRect];
    
#warning we shouldn't have to set the anchor point here. Look for answers at http://developer.apple.com/library/mac/#releasenotes/Cocoa/AppKit.html
    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    self.layer.position = CGPointMake(CGRectGetMidX(frameRect), CGRectGetMidY(frameRect));
    self.layer.bounds = CGRectMake(0, 0, frameRect.size.width, frameRect.size.height);
}

- (void)setCenter:(CGPoint)center
{
    CGRect frame = NSRectToCGRect(self.frame);
    frame.origin = CGPointMake(center.x - CGRectGetWidth(frame) / 2,
                               center.y - CGRectGetHeight(frame) / 2);
    [self setFrame:frame];
}

- (CGPoint)center
{
    return self.layer.position;
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

@end

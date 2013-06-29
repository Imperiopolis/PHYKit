//
//  PHYView.m
//  PHYKit
//
//  Created by Nathan Trapp on 6/19/13.
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
        self.layer = [CALayer layer];

        [self setWantsLayer: YES];
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
        self.layer = [CALayer layer];
        
        [self setWantsLayer: YES];
    }
    
    return self;
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
    _frame = frameRect;
    
    self.layer.frame = NSRectToCGRect(frameRect);
}

- (void)setCenter:(CGPoint)center
{
    CGRect frame = self.layer.frame;
    frame.origin = center;
    self.layer.frame = frame;
}

- (CGPoint)center
{
    return self.layer.frame.origin;
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

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
{
    CGPoint _center;
    BOOL _loadedFromXib;
    BOOL _coordinatesHaveBeenSantized;
}
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

// flip coordinates when loading a xib
- (void)awakeFromNib
{
    _loadedFromXib = YES;
    if (!_coordinatesHaveBeenSantized && self.superview)
    {
        self.center = [self flippedCoordinatesFromSuperview: self.superview];
    }
}

- (void)viewWillMoveToSuperview:(NSView *)newSuperview
{
    if (_loadedFromXib)
    {
        self.center = [self flippedCoordinatesFromSuperview: newSuperview];
    }

    [super viewWillMoveToSuperview: newSuperview];
}

- (CGPoint)flippedCoordinatesFromSuperview:(NSView*)superview
{
    CGFloat height;
#warning find a better thing than themeframe
    if ([superview isKindOfClass:NSClassFromString(@"NSThemeFrame")])
    {
        height = NSHeight(self.frame);
    }
    else
    {
        height = NSHeight(superview.frame);
    }
    
    _coordinatesHaveBeenSantized = YES;

    return CGPointMake(NSMinX(self.frame) + NSWidth(self.frame) / 2,
                       height - NSMinY(self.frame) - NSHeight(self.frame) / 2);
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
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:duration];
    if (animationBlock)
    {
        animationBlock();
    }
    [NSAnimationContext endGrouping];

    if(completionBlock)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration), dispatch_get_current_queue(), ^{
            completionBlock();
        });
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

        self.center = CGPointMake(NSMinX(self.frame) + NSWidth(self.frame) / 2,
                                  NSMinY(self.frame) + NSHeight(self.frame) / 2);
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
    _center = center;

    NSRect frame = self.frame;
    frame.origin = NSMakePoint(center.x - NSWidth(frame) / 2,
                               center.y - NSHeight(frame) / 2);
    [self setFrame:frame];
}

- (CGPoint)center
{
    return _center;
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

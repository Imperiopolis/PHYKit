//
//  PHYView.m
//  DragonDrop
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import "PHYView.h"

@interface PHYView ()

@end

@implementation PHYView

@synthesize superview=_superview;

- (void)setSuperview:(id)superview
{
    
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super init]))
    {
        _clearsContextBeforeDrawing = YES;
        _userInteractionEnabled = YES;
        _subviews = [NSMutableSet set];
        
        _layer = [CALayer layer];
        _layer.delegate = self;
//        _layer.layoutManager = [UIViewLayoutManager layoutManager];
        
        self.contentScaleFactor = 0;
        self.frame = frame;
        self.alpha = 1;
        self.opaque = YES;
        [self setNeedsDisplay];
    }
    
    return self;
}

- (void)setNeedsDisplay
{
    [_layer setNeedsDisplay];
}


- (PHYView *)hitTest:(CGPoint)point
{
    return nil;
}

- (BOOL)pointInside:(CGPoint)point
{
    return NO;
}


- (void)removeFromSuperview
{
    
}

- (void)insertSubview:(PHYView *)view atIndex:(NSInteger)index
{
    
}

- (void)exchangeSubviewAtIndex:(NSInteger)index1 withSubviewAtIndex:(NSInteger)index2
{
    
}


- (void)addSubview:(PHYView *)view
{
    
}

- (void)insertSubview:(PHYView *)view belowSubview:(PHYView *)siblingSubview
{
    
}

- (void)insertSubview:(PHYView *)view aboveSubview:(PHYView *)siblingSubview
{
    
}


- (void)bringSubviewToFront:(PHYView *)view
{
    
}

- (void)sendSubviewToBack:(PHYView *)view
{
    
}


- (void)didAddSubview:(PHYView *)subview
{
    
}

- (void)willRemoveSubview:(PHYView *)subview
{
    
}


- (void)willMoveToSuperview:(PHYView *)newSuperview
{
    
}

- (void)didMoveToSuperview
{
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; frame = %@; hidden = %@; layer = %@>", [self className], self, NSStringFromRect(NSRectFromCGRect(self.frame)), (self.hidden ? @"YES" : @"NO"), self.layer];
}

@end

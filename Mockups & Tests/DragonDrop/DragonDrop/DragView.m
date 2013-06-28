//
//  DragView.m
//  DragonDrop
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import "DragView.h"
#import <QuartzCore/QuartzCore.h>

@interface DragView ()

@property (strong, nonatomic) CALayer *testLayer;
@property (nonatomic) NSPoint originalPoint;
@property (nonatomic) BOOL clickedInView;

@end

@implementation DragView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self doSetup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self doSetup];
    }
    return self;
}

- (void)awakeFromNib

{
    [self doSetup];
}

- (void)doSetup
{
    self.layer = [CALayer layer];
    [self setWantsLayer:YES];
    self.testLayer = [CALayer layer];
//    self.testLayer.anchorPoint = CGPointMake(0,0);
    self.testLayer.frame = CGRectMake(0, 0, 100, 100);
//    self.testLayer.bounds = CGRectMake(0, 0, 100, 100);
//    self.testLayer.position = CGPointMake(50, 50);
    self.testLayer.backgroundColor = [NSColor blueColor].CGColor;
    [self.layer addSublayer: self.testLayer];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint point = theEvent.locationInWindow;
    NSLog(@"%@", NSStringFromPoint(point));

    self.clickedInView = [self.testLayer hitTest:point] ? YES : NO;
    
    self.originalPoint = theEvent.locationInWindow;
}

- (void)mouseDragged:(NSEvent*)theEvent
{
    if (self.clickedInView) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        CGPoint position = self.testLayer.position;
        position.x += theEvent.deltaX;
        position.y -= theEvent.deltaY;
        self.testLayer.position = position;
        [CATransaction commit];
    }
}

@end

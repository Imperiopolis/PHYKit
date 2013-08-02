//
//  DragView.m
//  DragonDrop
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import "DragView.h"

@interface DragView ()

@property (strong, nonatomic) PHYView *testView;
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

- (void)awakeFromNib

{
    [self doSetup];
}

- (void)doSetup
{
    self.backgroundColor = [NSColor yellowColor];
    self.testView = [[PHYView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
    self.testView.backgroundColor = [NSColor blueColor];
    [self addSubview: self.testView];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint point = theEvent.locationInWindow;    

    self.clickedInView = [self.testView hitTest:point] ? YES : NO;
    
    self.originalPoint = theEvent.locationInWindow;
}

- (void)mouseDragged:(NSEvent*)theEvent
{
    if (self.clickedInView) {

        NSRect frame = self.testView.frame;
        frame.origin.x += theEvent.deltaX;
        frame.origin.y -= theEvent.deltaY;
        self.testView.frame = frame;
    }
}

@end

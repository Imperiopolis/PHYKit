//
//  AppDelegate.m
//  Animator
//
//  Created by Zev Eisenberg on 6/19/13.
//  Copyright (c) 2013 Zev Eisenberg. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import <PHYKit/PHYKit.h>

// rgb hex to UIColor macro from http://www.ericd.net/2009/05/iphone-want-to-use-hex-for-uicolor.html
#define NSColorFromRGB(rgbValue) [NSColor \
colorWithCalibratedRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// modified macro for rgba
#define NSColorFromRGBA(rgbaValue) [NSColor \
colorWithCalibratedRed:((float)((rgbaValue & 0xFF000000) >> 24)) / 255.0 \
green:((float)((rgbaValue & 0xFF0000) >> 16)) / 255.0 \
blue:((float)((rgbaValue & 0xFF00) >> 8)) / 255.0 \
alpha:((float)(rgbaValue & 0xFF)) / 255.0]

@interface AppDelegate ()
@property (strong, nonatomic) NSMutableArray *viewsArray;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    PHYView *rootView = [[PHYView alloc] initWithFrame:[self.window.contentView frame]];
    
    [self.window.contentView addSubview:rootView];
    
    self.viewsArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 2000; i++)
    {
        NSPoint origin = NSMakePoint(arc4random() % (u_int32_t)CGRectGetWidth(self.window.frame), arc4random() % (u_int32_t)CGRectGetHeight(self.window.frame));
        
        NSColor *color = NSColorFromRGBA(arc4random() % 0xFFFFFFFF);
                
        PHYView *view = [[PHYView alloc] initWithFrame:NSMakeRect(origin.x, origin.y, 100, 100)];
        view.backgroundColor = color;
        
        [rootView addSubview:view];
        
        [self.viewsArray addObject:view];
    }
    
    [self animateViews];
}

- (void)animateViews
{

    for (PHYView *view in self.viewsArray)
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];

        animation.fromValue = [view.layer valueForKey:@"position"];
        animation.duration = 0.5 + ((arc4random() % 100) / 50.0);
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        NSPoint newPoint = NSMakePoint(arc4random() % (u_int32_t)CGRectGetWidth(self.window.frame), arc4random() % (u_int32_t)CGRectGetHeight(self.window.frame));
        
        animation.toValue = [NSValue valueWithPoint:newPoint];
        
        NSRect frame = view.frame;
        frame.origin = newPoint;
        view.frame = frame;

        [view.layer addAnimation:animation forKey:@"position"];
    }
    
    [self performSelector:@selector(animateViews) withObject:nil afterDelay:3.0];
}

@end

//
//  AppDelegate.m
//  Animator
//
//  Created by Zev Eisenberg on 6/19/13.
//  Copyright (c) 2013 Zev Eisenberg. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

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
@property (strong, nonatomic) NSMutableArray *layersArray;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    CALayer *rootLayer = [CALayer layer];
    [self.window.contentView setWantsLayer:YES];
    [self.window.contentView setLayer:rootLayer];
    
    self.layersArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 2000; i++)
    {
        NSPoint origin = NSMakePoint(arc4random() % (u_int32_t)CGRectGetWidth(self.window.frame), arc4random() % (u_int32_t)CGRectGetHeight(self.window.frame));
        
        NSColor *color = NSColorFromRGBA(arc4random() % 0xFFFFFFFF);
                
        CALayer *layer = [CALayer layer];
        layer.frame = NSMakeRect(origin.x, origin.y, 100, 100);
        layer.backgroundColor = color.CGColor;
        
        [rootLayer addSublayer:layer];
        
        [self.layersArray addObject:layer];
    }
    
    [self animateViews];
}

- (void)animateViews
{

    for (CALayer *layer in self.layersArray)
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];

        animation.fromValue = [layer valueForKey:@"position"];
        animation.duration = 0.5 + ((arc4random() % 100) / 50.0);
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        NSPoint newPoint = NSMakePoint(arc4random() % (u_int32_t)CGRectGetWidth(self.window.frame), arc4random() % (u_int32_t)CGRectGetHeight(self.window.frame));
        
        animation.toValue = [NSValue valueWithPoint:newPoint];
        
        layer.position = newPoint;

        [layer addAnimation:animation forKey:@"position"];
    }
    
    [self performSelector:@selector(animateViews) withObject:nil afterDelay:3.0];
}

@end

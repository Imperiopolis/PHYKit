//
//  NSView+PHYViews.m
//  DragonDrop
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import "NSView+PHYViews.h"
#import "PHYView.h"
#import <objc/objc-runtime.h>

@implementation NSView (PHYViews)

- (void)setPhySubviews:(NSArray *)phySubviews
{
    objc_setAssociatedObject(self, @selector(phySubviews), phySubviews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray*)phySubviews
{
    return [NSArray arrayWithArray:objc_getAssociatedObject(self, @selector(phySubviews))];
}

- (void)addPhySubview:(PHYView *)phyView
{
    NSMutableArray *subviews = objc_getAssociatedObject(self, @selector(phySubviews));
    
    if (!subviews)
    {
        [self setPhySubviews:[NSMutableArray array]];
    }
    
    [subviews addObject:phyView];
    [self.layer addSublayer: phyView.layer];
    //phyView->_superview = self;
}

@end

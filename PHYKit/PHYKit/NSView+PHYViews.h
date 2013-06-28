//
//  NSView+PHYViews.h
//  DragonDrop
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import <Cocoa/Cocoa.h>

@class PHYView;

@interface NSView (PHYViews)

@property (readonly) NSArray *phySubviews;

- (void)addPhySubview: (PHYView *)phyView;

@end

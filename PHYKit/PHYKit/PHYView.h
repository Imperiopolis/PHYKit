//
//  PHYView.h
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import <Foundation/Foundation.h>
#import "PHYDynamicBehavior.h"

@protocol PHYViewDelegate <NSObject>
@optional
- (void)viewClicked:(NSEvent*)event;
- (void)viewDragged:(NSEvent*)event;

@end

@interface PHYView : NSView <PHYDynamicItem>

@property (weak) id<PHYViewDelegate> delegate;

@property (nonatomic) CGAffineTransform transform;
@property (nonatomic) NSColor *backgroundColor;

@end

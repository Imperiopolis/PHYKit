//
//  PHYView.h
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import <Foundation/Foundation.h>
#import "PHYDynamicBehavior.h"

@interface PHYView : NSView <PHYDynamicItem>

@property (nonatomic) CGAffineTransform transform;
@property (nonatomic) NSColor *backgroundColor;

@end

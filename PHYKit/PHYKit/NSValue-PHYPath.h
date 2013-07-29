//
//  NSValue-PHYPath.h
//  PHYKit
//
//  Created by Nathan Trapp on 7/27/13.
//
//

#import <Foundation/NSValue.h> 

@interface NSValue (PHYPath)
+ (id)valueWithCGPoint:(struct CGPoint)arg1;
- (struct CGPoint)CGPointValue;
@end


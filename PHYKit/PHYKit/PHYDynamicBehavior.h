//
//  PHYDynamicBehavior.h
//  DragonDrop
//
//  Created by Nathan Trapp on 6/19/13.
//
//

#import <Foundation/Foundation.h>

@protocol PHYDynamicItem <NSObject>

@property (nonatomic, readwrite) CGPoint center;
@property (nonatomic, readonly) CGRect bounds;
@property (nonatomic, readwrite) CGAffineTransform transform;

@end

@interface PHYDynamicBehavior : NSObject

- (void)addChildBehavior:(PHYDynamicBehavior *)behavior;
- (void)removeChildBehavior:(PHYDynamicBehavior *)behavior;

@property (nonatomic, readonly, copy) NSArray *childBehaviors;
@property (nonatomic, copy) void (^action)(void);

@end

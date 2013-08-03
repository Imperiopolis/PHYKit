//
//  PHYDynamicItemBehavior.h
//  PHYKit
//
//  Created by Nora Trapp on 6/19/13.
//
//

#import "PHYDynamicBehavior.h"

@interface PHYDynamicItemBehavior : PHYDynamicBehavior

- (instancetype)initWithItems:(NSArray *)items;

- (void)addItem:(id <PHYDynamicItem>)item;
- (void)removeItem:(id <PHYDynamicItem>)item;

- (void)addLinearVelocity:(CGPoint)velocity forItem:(id <PHYDynamicItem>)item;
- (CGPoint)linearVelocityForItem:(id <PHYDynamicItem>)item;

- (void)addAngularVelocity:(CGFloat)velocity forItem:(id <PHYDynamicItem>)item;
- (CGFloat)angularVelocityForItem:(id <PHYDynamicItem>)item;

@property (readwrite, nonatomic) CGFloat elasticity;
@property (readwrite, nonatomic) CGFloat friction;
@property (readwrite, nonatomic) CGFloat density;
@property (readwrite, nonatomic) CGFloat resistance;
@property (readwrite, nonatomic) CGFloat angularResistance;
@property (readwrite, nonatomic) BOOL allowsRotation;

@end

//
//  PHYAttachmentBehavior.h
//  PHYKit
//
//  Created by Nathan Trapp on 8/3/13.
//  Copyright (c) 2013 Nathan Trapp. All rights reserved.
//

#import "PHYDynamicBehavior.h"

typedef NS_ENUM(NSInteger, PHYAttachmentBehaviorType) {
    PHYAttachmentBehaviorTypeItems,
    PHYAttachmentBehaviorTypeAnchor
};

@interface PHYAttachmentBehavior : PHYDynamicBehavior

- (instancetype)initWithItem:(id <PHYDynamicItem>)item attachedToAnchor:(CGPoint)point;
- (instancetype)initWithItem:(id <PHYDynamicItem>)item offsetFromCenter:(PHYOffset)offset attachedToAnchor:(CGPoint)point;

- (instancetype)initWithItem:(id <PHYDynamicItem>)item1 attachedToItem:(id <PHYDynamicItem>)item2;
- (instancetype)initWithItem:(id <PHYDynamicItem>)item1 offsetFromCenter:(PHYOffset)offset1 attachedToItem:(id <PHYDynamicItem>)item2 offsetFromCenter:(PHYOffset)offset2;

@property (readonly, nonatomic) PHYAttachmentBehaviorType attachedBehaviorType;

@property (readwrite, nonatomic) CGPoint anchorPoint;

@property (readwrite, nonatomic) CGFloat length;
@property (readwrite, nonatomic) CGFloat damping; // 1: critical damping
@property (readwrite, nonatomic) CGFloat frequency; // in Hertz

@end

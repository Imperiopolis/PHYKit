//
//  UIAttachmentBehavior.h
//  UIKit
//
//  Copyright (c) 2012-2013, Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIDynamicBehavior.h>

typedef NS_ENUM(NSInteger, UIAttachmentBehaviorType) {
    UIAttachmentBehaviorTypeItems,
    UIAttachmentBehaviorTypeAnchor
} NS_ENUM_AVAILABLE_IOS(7_0);

NS_CLASS_AVAILABLE_IOS(7_0) @interface UIAttachmentBehavior : UIDynamicBehavior

- (instancetype)initWithItem:(id <UIDynamicItem>)item attachedToAnchor:(CGPoint)point;
- (instancetype)initWithItem:(id <UIDynamicItem>)item point:(CGPoint)p1 attachedToAnchor:(CGPoint)point;

- (instancetype)initWithItem:(id <UIDynamicItem>)item1 attachedToItem:(id <UIDynamicItem>)item2;
- (instancetype)initWithItem:(id <UIDynamicItem>)item1 point:(CGPoint)p1 attachedToItem:(id <UIDynamicItem>)item2 point:(CGPoint)p2 ;

@property (nonatomic, readonly, copy) NSArray* items;

@property (readonly, nonatomic) UIAttachmentBehaviorType attachedBehaviorType;

@property (readwrite, nonatomic) CGPoint anchorPoint;

@property (readwrite, nonatomic) CGFloat length;
@property (readwrite, nonatomic) CGFloat damping; // 1: critical damping
@property (readwrite, nonatomic) CGFloat frequency; // in Hertz

@end

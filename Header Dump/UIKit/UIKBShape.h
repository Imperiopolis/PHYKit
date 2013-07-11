/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
NSCoding.hNSCopying.h
@class UIKBGeometry;

@interface UIKBShape : NSObject <NSCoding, NSCopying>
{
    UIKBGeometry *m_geometry;
    struct CGRect m_originalFrame;
    struct CGRect m_frame;
    struct CGRect m_paddedFrame;
    unsigned int m_uid;
    BOOL m_scaled;
}

+ (id)shapeByCombining:(id)arg1 withShape:(id)arg2;
+ (id)shape;
@property(readonly, nonatomic) unsigned int uid; // @synthesize uid=m_uid;
@property(nonatomic) struct CGRect paddedFrame; // @synthesize paddedFrame=m_paddedFrame;
@property(nonatomic) struct CGRect frame; // @synthesize frame=m_frame;
@property(retain, nonatomic) UIKBGeometry *geometry; // @synthesize geometry=m_geometry;
- (void)scaleIfNeeded:(float)arg1 onlyYAxis:(BOOL)arg2;
- (struct CGRect)_scaleRect:(struct CGRect)arg1 inYAxis:(BOOL)arg2;
- (void)scaleWidth:(float)arg1;
- (void)addRectFrom:(id)arg1 widthFraction:(float)arg2 adjustOriginFactor:(float)arg3;
- (void)addRectFrom:(id)arg1;
- (id)description;
- (BOOL)isEmpty;
@property(readonly, nonatomic) struct CGRect originalFrame;
- (void)setFrameOnly:(struct CGRect)arg1;
- (void)setFrame:(struct CGRect)arg1 resetOriginalFrame:(BOOL)arg2;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (BOOL)isEqual:(id)arg1;
- (unsigned int)hash;
- (void)makeLikeOther:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (void)dealloc;
- (id)initWithGeometry:(id)arg1 frame:(struct CGRect)arg2 paddedFrame:(struct CGRect)arg3;
- (id)init;

@end


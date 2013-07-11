/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
__attribute__((visibility("hidden")))
@interface UIActivityItemImageRep : NSObject
{
    id _asset;
    id _thumbnailProvider;
    id _dataProvider;
}

+ (id)activityItemImageRepWithAsset:(id)arg1 thumbnailProvider:(id)arg2 dataProvider:(void)arg3;
@property(copy, nonatomic) id dataProvider; // @synthesize dataProvider=_dataProvider;
@property(copy, nonatomic) id thumbnailProvider; // @synthesize thumbnailProvider=_thumbnailProvider;
@property(retain, nonatomic) id asset; // @synthesize asset=_asset;
- (id)data;
- (id)thumbnail;
- (void)dealloc;

@end


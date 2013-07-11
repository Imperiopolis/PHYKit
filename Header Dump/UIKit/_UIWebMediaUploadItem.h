/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@class NSString, UIImage;

__attribute__((visibility("hidden")))
@interface _UIWebMediaUploadItem : NSObject
{
    BOOL _video;
    NSString *_filePath;
    UIImage *_originalImage;
}

+ (id)mediaUploadItemWithFilePath:(id)arg1 image:(id)arg2 isVideo:(BOOL)arg3;
@property(nonatomic, getter=isVideo) BOOL video; // @synthesize video=_video;
@property(retain, nonatomic) UIImage *originalImage; // @synthesize originalImage=_originalImage;
@property(retain, nonatomic) NSString *filePath; // @synthesize filePath=_filePath;
- (id)displayImage;
- (id)_imageForVideoFile:(id)arg1;
- (id)_squareImage:(id)arg1;
- (struct CGRect)_squareCropRectForSize:(struct CGSize)arg1;
- (void)dealloc;
- (id)initWithFilePath:(id)arg1 image:(id)arg2 isVideo:(BOOL)arg3;

@end


/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@class NSString;

__attribute__((visibility("hidden")))
@interface UIKeyboardEmoji : NSObject
{
    NSString *_emojiString;
    BOOL _hasDingbat;
}

+ (id)emojiWithString:(id)arg1 hasDingbat:(BOOL)arg2;
@property BOOL hasDingbat; // @synthesize hasDingbat=_hasDingbat;
@property(retain, nonatomic) NSString *emojiString; // @synthesize emojiString=_emojiString;
- (BOOL)isEqual:(id)arg1;
- (id)key;
- (void)dealloc;
- (id)initWithString:(id)arg1 hasDingbat:(BOOL)arg2;

@end


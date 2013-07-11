/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UITextRange.h>

@class DOMRange;

__attribute__((visibility("hidden")))
@interface UITextRangeImpl : UITextRange
{
    DOMRange *_domRange;
    int _affinityIfCollapsed;
}

+ (id)wrapDOMRange:(id)arg1;
+ (id)wrapDOMRange:(id)arg1 withAffinity:(int)arg2;
@property(nonatomic) int affinity; // @synthesize affinity=_affinityIfCollapsed;
@property(retain, nonatomic) DOMRange *domRange; // @synthesize domRange=_domRange;
- (BOOL)isEqual:(id)arg1;
- (BOOL)isEmpty;
- (id)end;
- (id)start;
- (void)adjustAffinityOfPosition:(id)arg1 isStart:(BOOL)arg2;
- (void)dealloc;
- (id)description;

@end


/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@class NSIndexPath, UITableViewUpdateGap;

__attribute__((visibility("hidden")))
@interface UIUpdateItem : NSObject
{
    int _action;
    NSIndexPath *_indexPath;
    int _animation;
    float _offset;
    UITableViewUpdateGap *_gap;
    BOOL _headerFooterOnly;
    BOOL _skipAnimation;
}

@property(nonatomic) BOOL skipAnimation; // @synthesize skipAnimation=_skipAnimation;
@property(nonatomic) BOOL headerFooterOnly; // @synthesize headerFooterOnly=_headerFooterOnly;
@property(nonatomic) UITableViewUpdateGap *gap; // @synthesize gap=_gap;
@property(nonatomic) float offset; // @synthesize offset=_offset;
@property(nonatomic) int animation; // @synthesize animation=_animation;
@property(readonly, nonatomic) NSIndexPath *indexPath; // @synthesize indexPath=_indexPath;
@property(readonly, nonatomic) int action; // @synthesize action=_action;
- (int)inverseCompareIndexPaths:(id)arg1;
- (int)compareIndexPaths:(id)arg1;
- (BOOL)isSectionOperation;
- (id)_actionDescription;
- (void)dealloc;
- (id)initWithAction:(int)arg1 forIndexPath:(id)arg2 animation:(int)arg3;

@end


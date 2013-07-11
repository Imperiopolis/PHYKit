/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UITextSelectionRect.h>

__attribute__((visibility("hidden")))
@interface _UITextKitSelectionRect : UITextSelectionRect
{
    struct CGRect _rect;
    BOOL _containsEnd;
    BOOL _containsStart;
    BOOL _vertical;
}

+ (id)selectionRectWithRect:(struct CGRect)arg1;
@property(nonatomic, getter=isVertical) BOOL vertical; // @synthesize vertical=_vertical;
@property(nonatomic) BOOL containsStart; // @synthesize containsStart=_containsStart;
@property(nonatomic) BOOL containsEnd; // @synthesize containsEnd=_containsEnd;
@property(nonatomic) struct CGRect rect; // @synthesize rect=_rect;
- (id)description;
- (int)writingDirection;

@end


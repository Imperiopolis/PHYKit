/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <UIKit/UITableViewCell.h>

@class UIColor, UIView;

__attribute__((visibility("hidden")))
@interface _UIModalItemTableViewCell : UITableViewCell
{
    BOOL _showFullWidthSeparator;
    UIColor *_fullWitdhSeparatorColor;
    UIView *_fullWidthSeparatorView;
    UIView *_topSeparatorView;
}

@property(retain, nonatomic) UIColor *fullWidthSeparatorColor; // @synthesize fullWidthSeparatorColor=_fullWitdhSeparatorColor;
@property(nonatomic) BOOL showFullWidthSeparator; // @synthesize showFullWidthSeparator=_showFullWidthSeparator;
- (void)dealloc;
@property(readonly, nonatomic) UIView *topSeparatorView; // @synthesize topSeparatorView=_topSeparatorView;
- (void)layoutSubviews;
- (id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2;

@end


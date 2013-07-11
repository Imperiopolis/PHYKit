/*
 *     Generated by class-dump 3.4 (64 bit).
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
 */

#import <Foundation/NSObject.h>
@class UIDocument;

__attribute__((visibility("hidden")))
@interface UIDocumentErrorRecoveryAttempter : NSObject
{
    UIDocument *_document;
    id _wrappedRecoveryAttempter;
    id _continuerOrNil;
    int _silentRecoveryOptionIndex;
    id _appModalRecoveryAttempter;
    id _recoveryCancelerOrNil;
    struct {
        unsigned int attemptedRecovery:1;
    } _errorRecoveryAttempterFlags;
}

- (void)cancelRecovery;
- (BOOL)attemptSilentRecoveryFromError:(id)arg1 error:(id *)arg2;
- (BOOL)attemptRecoveryFromError:(id)arg1 optionIndex:(unsigned int)arg2;
- (void)dealloc;
- (id)initWithDocument:(id)arg1 silentRecoveryOptionIndex:(unsigned int)arg2 appModalRecoveryAttempter:(id)arg3 recoveryCanceler:(void)arg4;
- (id)initWithDocument:(id)arg1 wrappedRecoveryAttempter:(id)arg2;

@end


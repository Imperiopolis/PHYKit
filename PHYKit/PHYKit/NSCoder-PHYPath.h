//
//  NSCoder-PHYPath.h
//  PHYKit
//
//  Created by Nora Trapp on 7/27/13.
//
//

#import <Foundation/NSCoder.h> 

@interface NSCoder (PHYPath)
- (struct CGRect)decodeCGRectForKey:(id)arg1;
- (struct CGSize)decodeCGSizeForKey:(id)arg1;
- (struct CGPoint)decodeCGPointForKey:(id)arg1;
- (void)encodeCGRect:(struct CGRect)arg1 forKey:(id)arg2;
- (void)encodeCGSize:(struct CGSize)arg1 forKey:(id)arg2;
- (void)encodeCGPoint:(struct CGPoint)arg1 forKey:(id)arg2;
@end


//
//  CCAuthValidator.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCAuthValidator : NSObject

- (BOOL)isValidPassword:(NSString *)thePassword;
- (BOOL)isValidEmail:(NSString *)theEmail;
- (BOOL)isEmptyString:(NSString *)theString;

@end

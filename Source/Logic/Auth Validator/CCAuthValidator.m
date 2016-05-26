//
//  CCAuthValidator.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCAuthValidator.h"

static NSString *const EmailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
static NSUInteger const MaxPasswordLenght = 32;

@implementation CCAuthValidator

- (BOOL)isValidPassword:(NSString *)password
{
    BOOL isValidInput = [self isEmptyString:password];
    
    if (!([password length] >= MaxPasswordLenght))
    {
        isValidInput = NO;
    }
    
    return isValidInput;
}

- (BOOL)isValidEmail:(NSString *)email
{
    BOOL isValidInput = [self isEmptyString:email];
    
    if (![self validateEmail:email])
    {
        isValidInput = NO;
    }
    
    return isValidInput;
}

- (BOOL)isEmptyString:(NSString *)string
{
    BOOL isValidInput = YES;
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (![string length] > 0)
    {
        isValidInput = NO;
    }
    
    return isValidInput;
}

#pragma mark - Private

- (BOOL)validateEmail:(NSString *)candidate
{
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", EmailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

@end

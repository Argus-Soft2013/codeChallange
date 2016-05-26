//
//  CCHash.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCHash.h"

#include <CommonCrypto/CommonDigest.h>

static NSUInteger const IterationCount = 5000;

@implementation CCHash

+ (NSString *)hashWithString:(NSString *)input
{
    if (input == nil)
    {
        return nil;
    }
    
    unsigned char digest[CC_SHA512_DIGEST_LENGTH];
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    CC_SHA512(cstr, (CC_LONG)strlen(cstr), digest);
    
    NSData *hashData = [[NSData alloc] initWithBytes:digest length:sizeof digest];
    
    NSString *output = [hashData base64EncodedStringWithOptions:0];
    
    return output;
}

+ (NSString *)hashForLoginWithString:(NSString *)input
{
    if (input == nil)
    {
        return nil;
    }
    
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(cstr, (CC_LONG)strlen(cstr), digest);
    
    for (int i = 1; i < IterationCount; i++)
    {
        CC_SHA512_CTX context;
        CC_SHA512_Init(&context);
        CC_SHA512_Update(&context, digest, (CC_LONG)CC_SHA512_DIGEST_LENGTH);
        CC_SHA512_Update(&context, cstr, (CC_LONG)strlen(cstr));
        CC_SHA512_Final(digest, &context);
    }
    
    NSString *output = [[NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH] base64EncodedStringWithOptions:0];
    
    return output;
}

@end

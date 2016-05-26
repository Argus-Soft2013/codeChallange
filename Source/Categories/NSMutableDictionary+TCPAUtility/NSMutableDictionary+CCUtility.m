//
//  NSMutableDictionary+CCUtility.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "NSMutableDictionary+CCUtility.h"

@implementation NSMutableDictionary (CCUtility)

- (void)cc_setNotNilObject:(id)theObject forKey:(id<NSCopying>)theKey
{
    if (!theObject || [theObject isKindOfClass:[NSNull class]])
    {
        return;
    }
    else
    {
        [self setObject:theObject forKey:theKey];
    }
}

@end

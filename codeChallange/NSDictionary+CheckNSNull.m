//
//  NSDictionary+CheckNSNull.m
//  membership-ios
//
//  Created by Dmitry Krasulya on 11/25/15.
//  Copyright © 2015 Dmitry Krasulya. All rights reserved.
//

#import "NSDictionary+CheckNSNull.h"

@implementation NSDictionary (CheckNSNull)

+ (NSDictionary *)checkNSNull:(id)value
{
    if (value == [NSNull null] || value == nil)
        return @{};
    else
        return value;
}


//==============================================================================

+(NSDictionary *)checkNil:(id)value
{
    if([value isKindOfClass:NSDictionary.class])
        return value;
    else
        return @{};
}


//==============================================================================


+(BOOL)isDictionaryEmpty:(id)value
{
    if (value == [NSNull null] || value == nil || [value isEqualToDictionary:@{}])
        return YES;
    else
        return NO;
}

@end

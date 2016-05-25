//
//  NSString+CheckNSNull.m
//  Conference Konnect
//
//  Created by Iraklii Tavadze on 01.07.14.
//  Copyright (c) 2014 Design and Test Lab. All rights reserved.
//

#import "NSString+CheckNSNull.h"

@implementation NSString (CheckNSNull)

+ (NSString *)checkNSNull:(id)value
{
	if (value == [NSNull null] || value == nil)
		return @"";
    else
		return value;
}


+(NSString *)checkNil:(id)value
{
    if([value isKindOfClass:NSString.class])
        return value;
    else
        return @"";
}

@end

//
//  NSNumber+CheckNSNull.m
//  bizi-baza
//
//  Created by krasylnikov on 5/1/15.
//  Copyright (c) 2015 Design and Test Lab. All rights reserved.
//

#import "NSNumber+CheckNSNull.h"

@implementation NSNumber(CheckNSNull)

//==============================================================================


+ (NSNumber *)checkNSNull:(id)value
{
    if (value == [NSNull null] || value == nil)
        return @0;
    else
        return value;
}


//==============================================================================


- (NSString *)stringBoolean
{
    return self.boolValue ? @"TRUE" : @"FALSE";
}


//==============================================================================

@end

//
//  CCLocalization.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCLocalization.h"

NSString *const CCLocalizationTableDefaultName = @"";

@implementation CCLocalization

#pragma mark - Public

+ (NSString *)localizedStringForKey:(NSString *)theKey
{
    return [self localizedStringForKey:theKey table:CCLocalizationTableDefaultName];
}

#pragma mark - Private

+ (NSString *)localizedStringForKey:(NSString *)theKey table:(NSString *)theTable
{
    return [[NSBundle bundleForClass:[self class]] localizedStringForKey:theKey value:@"" table:theTable];
}

@end

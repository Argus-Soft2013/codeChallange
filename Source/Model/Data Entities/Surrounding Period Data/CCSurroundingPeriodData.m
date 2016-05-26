//
//  CCSurroundingPeriodData.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCSurroundingPeriodData.h"
#import "NSMutableDictionary+CCUtility.h"

@implementation CCSurroundingPeriodData

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)theZone
{
    CCSurroundingPeriodData *copy = [[[self class] alloc] init];
    
    if (copy)
    {
        [copy setMaxValue:[_maxValue copy]];
        [copy setMinValue:[_minValue copy]];
        [copy setAvgValue:[_avgValue copy]];
        [copy setTimePeriod:[_timePeriod copy]];
    }
    
    return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)theDecoder
{
    self = [super init];
    
    if (self)
    {
        NSDictionary *rootDict = [theDecoder decodeObjectForKey:NSStringFromClass([CCSurroundingPeriodData class])];
        
        [self setMaxValue:rootDict[NSStringFromSelector(@selector(maxValue))]];
        [self setMinValue:rootDict[NSStringFromSelector(@selector(minValue))]];
        [self setAvgValue:rootDict[NSStringFromSelector(@selector(avgValue))]];
        [self setTimePeriod:rootDict[NSStringFromSelector(@selector(timePeriod))]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)theCoder
{
    NSMutableDictionary *rootDict = [NSMutableDictionary dictionary];
    
    [rootDict cc_setNotNilObject:[self maxValue] forKey:NSStringFromSelector(@selector(maxValue))];
    [rootDict cc_setNotNilObject:[self minValue] forKey:NSStringFromSelector(@selector(minValue))];
    [rootDict cc_setNotNilObject:[self avgValue] forKey:NSStringFromSelector(@selector(avgValue))];
    [rootDict cc_setNotNilObject:[self timePeriod] forKey:NSStringFromSelector(@selector(timePeriod))];
    
    [theCoder encodeObject:rootDict forKey:NSStringFromClass([CCSurroundingPeriodData class])];
}

#pragma mark - Compare

- (BOOL)isEqual:(id)theObject
{
    if (theObject == self)
    {
        return YES;
    }
    
    if (!theObject || !([theObject isKindOfClass:[self class]]) )
    {
        return NO;
    }
    
    return [self isEqualToSurroundingPeriodData:theObject];
}

- (BOOL)isEqualToSurroundingPeriodData:(CCSurroundingPeriodData *)theSurroundingPeriodData
{
    if (([theSurroundingPeriodData maxValue] != _maxValue) &&
        ![[theSurroundingPeriodData maxValue] isEqualToValue:_maxValue])
    {
        return NO;
    }
    
    if (([theSurroundingPeriodData minValue] != _minValue) &&
        ![[theSurroundingPeriodData minValue] isEqualToValue:_minValue])
    {
        return NO;
    }
    
    if (([theSurroundingPeriodData avgValue] != _avgValue) &&
        ![[theSurroundingPeriodData avgValue] isEqualToValue:_avgValue])
    {
        return NO;
    }
    
    if (([theSurroundingPeriodData timePeriod] != _timePeriod) &&
        ![[theSurroundingPeriodData timePeriod] isEqualToTimePeriod:_timePeriod])
    {
        return NO;
    }

    return YES;
}

- (NSUInteger)hash
{
    return [_maxValue hash] ^ [_minValue hash] ^ [_avgValue hash] ^ [_timePeriod hash];
}

@end

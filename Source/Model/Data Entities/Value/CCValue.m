//
//  CCValue.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCValue.h"
#import "NSMutableDictionary+CCUtility.h"

@implementation CCValue

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)theZone
{
    CCValue *copy = [[[self class] alloc] init];
    
    if (copy)
    {
        [copy setAmountInAggregationCurrency:[_amountInAggregationCurrency copy]];
        [copy setTimePeriod:[_timePeriod copy]];
        [copy setQuantity:_quantity];
    }
    
    return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)theDecoder
{
    self = [super init];
    
    if (self)
    {
        NSDictionary *rootDict = [theDecoder decodeObjectForKey:NSStringFromClass([CCValue class])];
        
        [self setAmountInAggregationCurrency:rootDict[NSStringFromSelector(@selector(amountInAggregationCurrency))]];
        [self setTimePeriod:rootDict[NSStringFromSelector(@selector(timePeriod))]];
        [self setQuantity:rootDict[NSStringFromSelector(@selector(quantity))]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)theCoder
{
    NSMutableDictionary *rootDict = [NSMutableDictionary dictionary];
    
    [rootDict cc_setNotNilObject:[self amountInAggregationCurrency] forKey:NSStringFromSelector(@selector(amountInAggregationCurrency))];
    [rootDict cc_setNotNilObject:[self timePeriod] forKey:NSStringFromSelector(@selector(timePeriod))];
    [rootDict cc_setNotNilObject:[self quantity] forKey:NSStringFromSelector(@selector(quantity))];
    
    [theCoder encodeObject:rootDict forKey:NSStringFromClass([CCValue class])];
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
    
    return [self isEqualToValue:theObject];
}

- (BOOL)isEqualToValue:(CCValue *)theValue
{
    if (([theValue amountInAggregationCurrency] != _amountInAggregationCurrency) &&
        ![[theValue amountInAggregationCurrency] isEqualToCurrency:_amountInAggregationCurrency])
    {
        return NO;
    }
    
    if (([theValue timePeriod] != _timePeriod) &&
        ![[theValue timePeriod] isEqualToTimePeriod:_timePeriod])
    {
        return NO;
    }
    
    if (([theValue quantity] != _quantity) &&
        ![[theValue quantity] isEqualToNumber:_quantity])
    {
        return NO;
    }
    
    return YES;
}

- (NSUInteger)hash
{
    return [_amountInAggregationCurrency hash] ^ [_timePeriod hash] ^ [_quantity hash];
}

@end

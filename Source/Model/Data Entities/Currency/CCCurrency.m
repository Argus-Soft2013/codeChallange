//
//  CCCurrency.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCCurrency.h"
#import "NSMutableDictionary+CCUtility.h"

@implementation CCCurrency

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)theZone
{
    CCCurrency *copy = [[[self class] alloc] init];
    
    if (copy)
    {
        [copy setUnit:_unit];
        [copy setValue:_value];
    }
    
    return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)theDecoder
{
    self = [super init];
    
    if (self)
    {
        NSDictionary *rootDict = [theDecoder decodeObjectForKey:NSStringFromClass([CCCurrency class])];
        
        [self setUnit:rootDict[NSStringFromSelector(@selector(unit))]];
        [self setValue:rootDict[NSStringFromSelector(@selector(value))]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)theCoder
{
    NSMutableDictionary *rootDict = [NSMutableDictionary dictionary];
    
    [rootDict cc_setNotNilObject:[self unit] forKey:NSStringFromSelector(@selector(unit))];
    [rootDict cc_setNotNilObject:[self value] forKey:NSStringFromSelector(@selector(value))];
    
    [theCoder encodeObject:rootDict forKey:NSStringFromClass([CCCurrency class])];
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
    
    return [self isEqualToCurrency:theObject];
}

- (BOOL)isEqualToCurrency:(CCCurrency *)theCurrency
{
    if (([theCurrency unit] != _unit) &&
        ![[theCurrency unit] isEqualToString:_unit])
    {
        return NO;
    }
    
    if (([theCurrency value] != _value) &&
        ![[theCurrency value] isEqualToNumber:_value])
    {
        return NO;
    }
    
    return YES;
}

- (NSUInteger)hash
{
    return [_unit hash] ^ [_value hash];
}

@end

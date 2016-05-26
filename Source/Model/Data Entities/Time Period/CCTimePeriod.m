//
//  CCTimePeriod.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCTimePeriod.h"
#import "NSMutableDictionary+CCUtility.h"

@implementation CCTimePeriod

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)theZone
{
    CCTimePeriod *copy = [[[self class] alloc] init];
    
    if (copy)
    {
        [copy setSliceUnit:_sliceUnit];
        [copy setSliceUnitCount:_sliceUnitCount];
        [copy setSliceCount:_sliceCount];
        [copy setPeriodEnd:_periodEnd];
    }
    
    return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)theDecoder
{
    self = [super init];
    
    if (self)
    {
        NSDictionary *rootDict = [theDecoder decodeObjectForKey:NSStringFromClass([CCTimePeriod class])];
        
        [self setSliceUnit:rootDict[NSStringFromSelector(@selector(sliceUnit))]];
        [self setSliceUnitCount:rootDict[NSStringFromSelector(@selector(sliceUnitCount))]];
        [self setSliceCount:rootDict[NSStringFromSelector(@selector(sliceCount))]];
        [self setPeriodEnd:rootDict[NSStringFromSelector(@selector(periodEnd))]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)theCoder
{
    NSMutableDictionary *rootDict = [NSMutableDictionary dictionary];
    
    [rootDict cc_setNotNilObject:[self sliceUnit] forKey:NSStringFromSelector(@selector(sliceUnit))];
    [rootDict cc_setNotNilObject:[self sliceUnitCount] forKey:NSStringFromSelector(@selector(sliceUnitCount))];
    [rootDict cc_setNotNilObject:[self sliceCount] forKey:NSStringFromSelector(@selector(sliceCount))];
    [rootDict cc_setNotNilObject:[self periodEnd] forKey:NSStringFromSelector(@selector(periodEnd))];
    
    [theCoder encodeObject:rootDict forKey:NSStringFromClass([CCTimePeriod class])];
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
    
    return [self isEqualToTimePeriod:theObject];
}

- (BOOL)isEqualToTimePeriod:(CCTimePeriod *)theTimePeriod
{
    if (([theTimePeriod sliceUnit] != _sliceUnit) &&
        ![[theTimePeriod sliceUnit] isEqualToString:_sliceUnit])
    {
        return NO;
    }
    
    if (([theTimePeriod sliceUnitCount] != _sliceUnitCount) &&
        ![[theTimePeriod sliceUnitCount] isEqualToNumber:_sliceUnitCount])
    {
        return NO;
    }
    
    if (([theTimePeriod sliceCount] != _sliceCount) &&
        ![[theTimePeriod sliceCount] isEqualToNumber:_sliceCount])
    {
        return NO;
    }
    
    if (([theTimePeriod periodEnd] != _periodEnd) &&
        ![[theTimePeriod periodEnd] isEqualToDate:_periodEnd])
    {
        return NO;
    }
    
    return YES;
}

- (NSUInteger)hash
{
    return [_sliceUnit hash] ^ [_sliceUnitCount hash] ^ [_sliceCount hash] ^ [_periodEnd hash];
}

@end

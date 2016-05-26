//
//  CCEntity.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCEntity.h"
#import "NSMutableDictionary+CCUtility.h"

@implementation CCEntity

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)theZone
{
    CCEntity *copy = [[[self class] alloc] init];
    
    if (copy)
    {
        [copy setCode:_code];
        [copy setLabel:_label];
        [copy setKpiValue:[_kpiValue copy]];
        [copy setSurroundingPeriodData:[_surroundingPeriodData copy]];
        [copy setDeleted:_deleted];
    }
    
    return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)theDecoder
{
    self = [super init];
    
    if (self)
    {
        NSDictionary *rootDict = [theDecoder decodeObjectForKey:NSStringFromClass([CCEntity class])];
        
        [self setCode:rootDict[NSStringFromSelector(@selector(code))]];
        [self setLabel:rootDict[NSStringFromSelector(@selector(label))]];
        _kpiValue = rootDict[NSStringFromSelector(@selector(kpiValue))];
        _surroundingPeriodData = rootDict[NSStringFromSelector(@selector(surroundingPeriodData))];
        _deleted = [rootDict[NSStringFromSelector(@selector(isDeleted))] boolValue];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)theCoder
{
    NSMutableDictionary *rootDict = [NSMutableDictionary dictionary];
    
    [rootDict cc_setNotNilObject:[self code] forKey:NSStringFromSelector(@selector(code))];
    [rootDict cc_setNotNilObject:[self label] forKey:NSStringFromSelector(@selector(label))];
    [rootDict cc_setNotNilObject:[self kpiValue] forKey:NSStringFromSelector(@selector(kpiValue))];
    [rootDict cc_setNotNilObject:[self surroundingPeriodData] forKey:NSStringFromSelector(@selector(surroundingPeriodData))];
    [rootDict setObject:@([self isDeleted]) forKey:NSStringFromSelector(@selector(isDeleted))];
    
    [theCoder encodeObject:rootDict forKey:NSStringFromClass([CCEntity class])];
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
    
    return [self isEqualToEntity:theObject];
}

- (BOOL)isEqualToEntity:(CCEntity *)theEntity
{
    if (([theEntity code] != _code) &&
        ![[theEntity code] isEqualToString:_code])
    {
        return NO;
    }
    
    if (([theEntity label] != _label) &&
        ![[theEntity label] isEqualToString:_label])
    {
        return NO;
    }
    
    if (([theEntity kpiValue] != _kpiValue) &&
        ![[theEntity kpiValue] isEqualToValue:_kpiValue])
    {
        return NO;
    }
    
    if (([theEntity surroundingPeriodData] != _surroundingPeriodData) &&
        ![[theEntity surroundingPeriodData] isEqualToSurroundingPeriodData:_surroundingPeriodData])
    {
        return NO;
    }
    
    if (([theEntity isDeleted] != _deleted))
    {
        return NO;
    }
    
    return YES;
}

- (NSUInteger)hash
{
    return [_code hash] ^ [_label hash] ^ [_kpiValue hash] ^ [_surroundingPeriodData hash] ^ _deleted;
}

@end

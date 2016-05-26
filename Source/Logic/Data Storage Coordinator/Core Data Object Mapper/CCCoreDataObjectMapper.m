//
//  CCCoreDataObjectMapper.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCCoreDataObjectMapper.h"

#import "KPICDCurrency.h"
#import "CCCurrency.h"

#import "KPICDEntity.h"
#import "CCEntity.h"

#import "KPICDSurroundingPeriodData.h"
#import "CCSurroundingPeriodData.h"

#import "KPICDTimePeriod.h"
#import "CCTimePeriod.h"

#import "KPICDUser.h"
#import "CCUser.h"

#import "KPICDValue.h"
#import "CCValue.h"

@interface CCCoreDataObjectMapper ()

#warning TODO: Object pool
@property(nonatomic, strong) NSMutableDictionary *objectPool;

@end

@implementation CCCoreDataObjectMapper

#pragma mark - Public
#pragma mark Object pool

- (void)startCollectingSharedIntances
{
    [self setObjectPool:[NSMutableDictionary dictionary]];
#warning TODO: Counter for simultaneous convertions
}

- (void)stopCollectionSharedInstances
{
#warning TODO: Counter for simultaneous convertions
    @autoreleasepool
    {
        [self setObjectPool:nil];
    }
}

#pragma mark Products

- (CCCurrency *)currencyFromInternalCurrency:(KPICDCurrency *)theCurrency
{
    if (theCurrency == nil)
    {
        return nil;
    }
    
    CCCurrency *currency = [[CCCurrency alloc] init];
    [currency setUnit:[theCurrency unit]];
    [currency setValue:[theCurrency value]];
    
    return currency;
}

- (CCEntity *)entityFromInternalEntity:(KPICDEntity *)theEntity
{
    if (theEntity == nil)
    {
        return nil;
    }
    
    CCEntity *entity = [[CCEntity alloc] init];
    [entity setCode:[theEntity code]];
    [entity setLabel:[theEntity label]];
    [entity setKpiValue:[self valueFromInternalValue:[theEntity kpiValue]]];
    [entity setSurroundingPeriodData:[self surroundingPeriodDataFromInternalSurroundingPeriodData:[theEntity surroundingPeriodData]]];
    [entity setDeleted:[theEntity isDeleted]];
    
    return entity;
}

- (CCSurroundingPeriodData *)surroundingPeriodDataFromInternalSurroundingPeriodData:(KPICDSurroundingPeriodData *)theSurroundingPeriodData
{
    if (theSurroundingPeriodData == nil)
    {
        return nil;
    }
    
    CCSurroundingPeriodData *surroundingPeriodData = [[CCSurroundingPeriodData alloc] init];
    [surroundingPeriodData setMaxValue:[self valueFromInternalValue:[theSurroundingPeriodData maxValue]]];
    [surroundingPeriodData setMinValue:[self valueFromInternalValue:[theSurroundingPeriodData minValue]]];
    [surroundingPeriodData setAvgValue:[self valueFromInternalValue:[theSurroundingPeriodData avgValue]]];
    [surroundingPeriodData setTimePeriod:[self timePeriodFromInternalTimePeriod:[theSurroundingPeriodData timePeriod]]];
    
    return surroundingPeriodData;
}

- (CCTimePeriod *)timePeriodFromInternalTimePeriod:(KPICDTimePeriod *)theTimePeriod
{
    if (theTimePeriod == nil)
    {
        return nil;
    }
    
    CCTimePeriod *timePeriod = [[CCTimePeriod alloc] init];
    [timePeriod setSliceUnit:[theTimePeriod sliceUnit]];
    [timePeriod setSliceUnitCount:[theTimePeriod sliceUnitCount]];
    [timePeriod setSliceCount:[theTimePeriod sliceCount]];
    [timePeriod setPeriodEnd:[theTimePeriod periodEnd]];
    
    return timePeriod;
}

- (CCUser *)userFromInternalUser:(KPICDUser *)theUser
{
    if (theUser == nil)
    {
        return nil;
    }
    
    CCUser *user = [[CCUser alloc] init];
    [user setLogin:[theUser login]];
    [user setPassword:[theUser password]];
    [user setEntity:[self entityFromInternalEntity:[theUser entity]]];
    
    return user;
}

- (CCValue *)valueFromInternalValue:(KPICDValue *)theValue
{
    if (theValue == nil)
    {
        return nil;
    }
    
    CCValue *value = [[CCValue alloc] init];
    [theValue setAmountInAggregationCurrency:[self currencyFromInternalCurrency:[theValue amountInAggregationCurrency]]];
    [theValue setTimePeriod:[self timePeriodFromInternalTimePeriod:[theValue timePeriod]]];
    [theValue setQuantity:[theValue quantity]];
    
    return value;
}

@end


//
//  KPICDValue.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPICDValue.h"
#import "KPICDCurrency.h"
#import "KPICDEntity.h"
#import "KPICDSurroundingPeriodData.h"
#import "KPICDTimePeriod.h"
#import "NSNumber+CheckNSNull.h"
#import "CoreDataManager.h"
#import "NSDictionary+CheckNSNull.h"

@implementation KPICDValue

+(instancetype)kpiCDValueWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    KPICDTimePeriod *timePeriod = ![NSDictionary isDictionaryEmpty:dict[@"timePeriod"]] ? [KPICDTimePeriod kpiCDTimePretiodWithDictionary:dict[@"timePeriod"]] : nil;
    KPICDCurrency *amountInAggregationCurrency = [KPICDCurrency kpiCDCurrencyWithDictionary:dict[@"amountInAggregationCurrency"]];
    NSNumber *quantity = [NSNumber checkNSNull:dict[@"quantity"]];
    
    KPICDValue *value = [[CoreDataManager shared]newKPIValue];
    value.timePeriod = timePeriod;
    value.amountInAggregationCurrency = amountInAggregationCurrency;
    value.amountInAggregationCurrency.kpiValue = value;
    value.timePeriod.kpiValueTimePeriod = value;
    value.quantity = quantity;
    
    
    [[CoreDataManager shared] saveContext];
    
    
    return value;
}


//==============================================================================


-(void)updateWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    NSNumber *quantity = [NSNumber checkNSNull:dict[@"quantity"]];
    self.quantity = quantity;
    if (![NSDictionary isDictionaryEmpty:dict[@"timePeriod"]])
        [self.timePeriod updateWithDictionary:dict[@"timePeriod"]];
    [self.amountInAggregationCurrency updateWithDictionary:dict[@"amountInAggregationCurrency"]];
    
    [[CoreDataManager shared]saveContext];
}

@end

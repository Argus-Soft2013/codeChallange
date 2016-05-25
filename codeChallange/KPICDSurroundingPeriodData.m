//
//  KPICDSurroundingPeriodData.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPICDSurroundingPeriodData.h"
#import "KPICDEntity.h"
#import "KPICDTimePeriod.h"
#import "KPICDValue.h"
#import "NSNumber+CheckNSNull.h"
#import "CoreDataManager.h"

@implementation KPICDSurroundingPeriodData

+(instancetype)surroundingPeriodDataWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    KPICDValue *minValue = [KPICDValue kpiCDValueWithDictionary:dict[@"minValue"]];
    KPICDValue *maxValue = [KPICDValue kpiCDValueWithDictionary:dict[@"maxValue"]];
    KPICDValue *avgValue = [KPICDValue kpiCDValueWithDictionary:dict[@"avgValue"]];
    
    KPICDTimePeriod *timePeriod = [KPICDTimePeriod kpiCDTimePretiodWithDictionary:dict[@"timePeriod"]];
    
    KPICDSurroundingPeriodData * newSurroundingPeriodData = [[CoreDataManager shared] newKPICDSurroundingPeriodData];
    
    newSurroundingPeriodData.minValue = minValue;
    newSurroundingPeriodData.maxValue = maxValue;
    newSurroundingPeriodData.avgValue = avgValue;
    newSurroundingPeriodData.timePeriod = timePeriod;
    
    newSurroundingPeriodData.minValue.surroundingPeriodDataMin = newSurroundingPeriodData;
    newSurroundingPeriodData.maxValue.surroundingPeriodDataMax = newSurroundingPeriodData;
    newSurroundingPeriodData.avgValue.surroundingPeriodDataAvg = newSurroundingPeriodData;
    newSurroundingPeriodData.timePeriod.surroundingPeriodDatatimePeriod = newSurroundingPeriodData;
    
    [[CoreDataManager shared] saveContext];
    
    return newSurroundingPeriodData;
}


//==============================================================================

-(void)updateWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    [self.minValue updateWithDictionary:dict[@"minValue"]];
    [self.maxValue updateWithDictionary:dict[@"maxValue"]];
    [self.avgValue updateWithDictionary:dict[@"avgValue"]];
    [self.timePeriod updateWithDictionary:dict[@"timePeriod"]];
    
    [[CoreDataManager shared] saveContext];
    
}

@end

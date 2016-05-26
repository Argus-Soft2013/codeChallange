//
//  KPICDEntity.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPICDEntity.h"
#import "KPICDSurroundingPeriodData.h"
#import "KPICDValue.h"
#import "NSString+CheckNSNull.h"
#import "NSNumber+CheckNSNull.h"
#import "NSDictionary+CheckNSNull.h"
#import "CoreDataManager.h"

@implementation KPICDEntity

+(instancetype)kpiCDEntityWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    NSString *code      = [NSString checkNil:dict[@"code"]];
    NSString *label     = [NSString checkNil:dict[@"label"]];
    
    KPICDEntity *newEntity = [[CoreDataManager shared] kpiEntityWithCode:code];
    if (!newEntity)
        newEntity = [[CoreDataManager shared] newKPIEntity];
    
    newEntity.code = code;
    newEntity.label = label;
    
    if (newEntity.surroundingPeriodData)
        [newEntity.surroundingPeriodData updateWithDictionary:dict[@"surroundingPeriodData"]];
    else
    {
        newEntity.surroundingPeriodData = [KPICDSurroundingPeriodData surroundingPeriodDataWithDictionary:dict[@"surroundingPeriodData"]];
        newEntity.surroundingPeriodData.kpiEntity = newEntity;
    }
    if (newEntity.kpiValue)
        [newEntity.kpiValue updateWithDictionary:dict[@"kpiValue"]];
    else
    {
        newEntity.kpiValue = [KPICDValue kpiCDValueWithDictionary:dict[@"kpiValue"]];
        newEntity.kpiValue.kpiEntity = newEntity;
    }
    
    [[CoreDataManager shared] saveContext];
    
    return newEntity;
}


//==============================================================================


-(void)initByDefault
{
    self.code = @"";
    self.label = @"";
    self.deleted = @NO;
}

@end

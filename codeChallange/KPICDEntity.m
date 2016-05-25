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

+(instancetype)kpientityWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    NSString *code      = [NSString checkNil:dict[@"code"]];
    NSString *label     = [NSString checkNil:dict[@"label"]];
    
    KPICDEntity *newEntity = [[CoreDataManager shared] kpiEntityWithCode:code];
    if (!newEntity)
        newEntity = [[CoreDataManager shared] newKPIEntity];
    
    newEntity.code = code;
    newEntity.label = label;
    
    if (![NSDictionary isDictionaryEmpty:dict[@"kpiValue"]])
    {
        newEntity.kpiValue = [KPICDValue kpiCDValueWithDictionary:dict[@"kpiValue"]];
        newEntity.kpiValue.kpiEntity = newEntity;
    }
    if (![NSDictionary isDictionaryEmpty:dict[@"surroundingPeriodData"]]){
        newEntity.surroundingPeriodData = [KPICDSurroundingPeriodData surroundingPeriodDataWithDictionary:dict[@"surroundingPeriodData"]];
        newEntity.surroundingPeriodData.kpiEntity = newEntity;
    }
    
    return newEntity;
}


//==============================================================================


-(void)initByDefault
{
    self.code = @"";
    self.label = @"";
}

@end

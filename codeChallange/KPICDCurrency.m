//
//  KPICDCurrency.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPICDCurrency.h"
#import "KPICDValue.h"
#import "CoreDataManager.h"
#import "NSNumber+CheckNSNull.h"
#import "NSString+CheckNSNull.h"


@implementation KPICDCurrency

+(instancetype)kpiCDCurrencyWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    NSString *unit = [NSString checkNSNull:dict[@"unit"]];
    NSNumber *value = [NSNumber checkNSNull:dict[@"value"]];
    
    KPICDCurrency *newKPICurrency = [[CoreDataManager shared] newKPICurrency];
    
    newKPICurrency.unit = unit;
    newKPICurrency.value = value;
    
    
    [[CoreDataManager shared] saveContext];
    
    
    return  newKPICurrency;
}


//==============================================================================


-(void)updateWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    NSString *unit = [NSString checkNSNull:dict[@"unit"]];
    NSNumber *value = [NSNumber checkNSNull:dict[@"value"]];
    self.unit = unit;
    self.value = value;
    
    [[CoreDataManager shared] saveContext];
}

@end

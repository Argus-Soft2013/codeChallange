//
//  KPICDTimePeriod.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPICDTimePeriod.h"
#import "KPICDSurroundingPeriodData.h"
#import "KPICDValue.h"
#import "CoreDataManager.h"
#import "NSString+CheckNSNull.h"
#import "NSNumber+CheckNSNull.h"

@implementation KPICDTimePeriod

+(instancetype)kpiCDTimePretiodWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    
    NSString *sliceUnit = [NSString checkNSNull:dict[@"sliceUnit"]];
    NSNumber *sliceUnitCount = [NSNumber checkNSNull:dict[@"sliceUnitCount"]];
    NSNumber *sliceCount = [NSNumber checkNSNull:dict[@"sliceCount"]];
    NSDate * periodEnd = [KPICDTimePeriod dateWithString:@"periodEnd"];
    
    KPICDTimePeriod *newTimePeriod = [[CoreDataManager shared]newKPITimePeriod];
    newTimePeriod.sliceUnit = sliceUnit;
    newTimePeriod.sliceCount = sliceCount;
    newTimePeriod.sliceUnitCount = sliceUnitCount;
    newTimePeriod.periodEnd = periodEnd;
    
    [[CoreDataManager shared] saveContext];
    
    
    return newTimePeriod;
}


//==============================================================================

-(void)updateWithDictionary:(NSDictionary *)dict
{
    NSParameterAssert(dict);
    
    NSString *sliceUnit = [NSString checkNSNull:dict[@"sliceUnit"]];
    NSNumber *sliceUnitCount = [NSNumber checkNSNull:dict[@"sliceUnitCount"]];
    NSNumber *sliceCount = [NSNumber checkNSNull:dict[@"sliceCount"]];
    NSDate * periodEnd = [KPICDTimePeriod dateWithString:@"periodEnd"];
    
    self.sliceUnit = sliceUnit;
    self.sliceCount = sliceCount;
    self.sliceUnitCount = sliceUnitCount;
    self.periodEnd = periodEnd;
    
    [[CoreDataManager shared] saveContext];

}


//==============================================================================


+(NSDate *)dateWithString:(NSString *)string
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    
    return [formatter dateFromString:string];
}

@end

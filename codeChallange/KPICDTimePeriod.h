//
//  KPICDTimePeriod.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KPICDSurroundingPeriodData, KPICDValue;

NS_ASSUME_NONNULL_BEGIN

static NSString *const kKPICDTimePeriod = @"KPICDTimePeriod";

@interface KPICDTimePeriod : NSManagedObject

+(instancetype)kpiCDTimePretiodWithDictionary:(NSDictionary *)dict;

-(void)updateWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

#import "KPICDTimePeriod+CoreDataProperties.h"

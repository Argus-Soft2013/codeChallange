//
//  KPICDValue.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KPICDCurrency, KPICDEntity, KPICDSurroundingPeriodData, KPICDTimePeriod;

NS_ASSUME_NONNULL_BEGIN

static NSString *kKPICDValue  = @"KPICDValue";

@interface KPICDValue : NSManagedObject

+(instancetype)kpiCDValueWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

#import "KPICDValue+CoreDataProperties.h"

//
//  KPICDSurroundingPeriodData.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KPICDEntity, KPICDTimePeriod, KPICDValue;

NS_ASSUME_NONNULL_BEGIN

static NSString *kKPICDSurroundingPeriodData = @"KPICDSurroundingPeriodData";

@interface KPICDSurroundingPeriodData : NSManagedObject

+(instancetype)surroundingPeriodDataWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

#import "KPICDSurroundingPeriodData+CoreDataProperties.h"

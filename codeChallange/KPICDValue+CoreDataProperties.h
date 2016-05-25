//
//  KPICDValue+CoreDataProperties.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDValue.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPICDValue (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *quantity;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodDataMax;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodDataMin;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodDataAvg;
@property (nullable, nonatomic, retain) KPICDCurrency *amountInAggregationCurrency;
@property (nullable, nonatomic, retain) KPICDTimePeriod *timePeriod;
@property (nullable, nonatomic, retain) KPICDEntity *kpiEntity;

@end

NS_ASSUME_NONNULL_END

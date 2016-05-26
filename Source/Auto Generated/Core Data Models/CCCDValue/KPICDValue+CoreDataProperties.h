//
//  KPICDValue+CoreDataProperties.h
//  
//
//  Created by DeMoN on 5/26/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDValue.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPICDValue (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *quantity;
@property (nullable, nonatomic, retain) KPICDCurrency *amountInAggregationCurrency;
@property (nullable, nonatomic, retain) KPICDEntity *kpiEntity;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodDataAvg;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodDataMax;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodDataMin;
@property (nullable, nonatomic, retain) KPICDTimePeriod *timePeriod;

@end

NS_ASSUME_NONNULL_END

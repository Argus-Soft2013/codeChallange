//
//  KPICDSurroundingPeriodData+CoreDataProperties.h
//  
//
//  Created by DeMoN on 5/26/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDSurroundingPeriodData.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPICDSurroundingPeriodData (CoreDataProperties)

@property (nullable, nonatomic, retain) KPICDValue *avgValue;
@property (nullable, nonatomic, retain) KPICDEntity *kpiEntity;
@property (nullable, nonatomic, retain) KPICDValue *maxValue;
@property (nullable, nonatomic, retain) KPICDValue *minValue;
@property (nullable, nonatomic, retain) KPICDTimePeriod *timePeriod;

@end

NS_ASSUME_NONNULL_END

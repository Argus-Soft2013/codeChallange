//
//  KPICDTimePeriod+CoreDataProperties.h
//  
//
//  Created by DeMoN on 5/26/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDTimePeriod.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPICDTimePeriod (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *periodEnd;
@property (nullable, nonatomic, retain) NSNumber *sliceCount;
@property (nullable, nonatomic, retain) NSString *sliceUnit;
@property (nullable, nonatomic, retain) NSNumber *sliceUnitCount;
@property (nullable, nonatomic, retain) KPICDValue *kpiValueTimePeriod;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodDatatimePeriod;

@end

NS_ASSUME_NONNULL_END

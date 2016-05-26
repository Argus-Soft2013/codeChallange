//
//  KPICDEntity+CoreDataProperties.h
//  
//
//  Created by DeMoN on 5/26/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPICDEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSNumber *deleted;
@property (nullable, nonatomic, retain) NSString *label;
@property (nullable, nonatomic, retain) KPICDValue *kpiValue;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodData;
@property (nullable, nonatomic, retain) KPICDUser *user;

@end

NS_ASSUME_NONNULL_END

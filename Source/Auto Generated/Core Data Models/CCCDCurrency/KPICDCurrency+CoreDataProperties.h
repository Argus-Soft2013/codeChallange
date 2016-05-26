//
//  KPICDCurrency+CoreDataProperties.h
//  
//
//  Created by DeMoN on 5/26/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDCurrency.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPICDCurrency (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *unit;
@property (nullable, nonatomic, retain) NSNumber *value;
@property (nullable, nonatomic, retain) KPICDValue *kpiValue;

@end

NS_ASSUME_NONNULL_END

//
//  KPICDEntity+CoreDataProperties.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPICDEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *label;
@property (nullable, nonatomic, retain) KPICDValue *kpiValue;
@property (nullable, nonatomic, retain) KPICDSurroundingPeriodData *surroundingPeriodData;
@property (nullable, nonatomic, retain) NSNumber *deleted;

@end

NS_ASSUME_NONNULL_END

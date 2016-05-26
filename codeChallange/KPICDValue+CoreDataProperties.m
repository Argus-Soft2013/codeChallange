//
//  KPICDValue+CoreDataProperties.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDValue+CoreDataProperties.h"

@implementation KPICDValue (CoreDataProperties)

@dynamic quantity;
@dynamic surroundingPeriodDataMax;
@dynamic surroundingPeriodDataMin;
@dynamic surroundingPeriodDataAvg;
@dynamic amountInAggregationCurrency;
@dynamic timePeriod;
@dynamic kpiEntity;

@end

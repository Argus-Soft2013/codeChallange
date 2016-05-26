//
//  KPICDCurrency.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KPICDValue;

NS_ASSUME_NONNULL_BEGIN

static NSString *const kKPICDCurrency = @"KPICDCurrency";

@interface KPICDCurrency : NSManagedObject

+(instancetype)kpiCDCurrencyWithDictionary:(NSDictionary *)dict;

-(void)updateWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

#import "KPICDCurrency+CoreDataProperties.h"

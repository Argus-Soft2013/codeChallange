//
//  CCCoreDataObjectMapper.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KPICDCurrency, KPICDEntity, KPICDSurroundingPeriodData, KPICDTimePeriod, KPICDUser, KPICDValue;
@class CCCurrency, CCEntity, CCSurroundingPeriodData, CCTimePeriod, CCUser, CCValue;

@interface CCCoreDataObjectMapper : NSObject

#pragma mark - Object pool

- (void)startCollectingSharedIntances;
- (void)stopCollectionSharedInstances;

#pragma mark - Content

- (CCCurrency *)currencyFromInternalCurrency:(KPICDCurrency *)theCurrency;
- (CCEntity *)entityFromInternalEntity:(KPICDEntity *)theEntity;
- (CCSurroundingPeriodData *)surroundingPeriodDataFromInternalSurroundingPeriodData:(KPICDSurroundingPeriodData *)theSurroundingPeriodData;
- (CCTimePeriod *)timePeriodFromInternalTimePeriod:(KPICDTimePeriod *)theTimePeriod;
- (CCUser *)userFromInternalUser:(KPICDUser *)theUser;
- (CCValue *)valueFromInternalValue:(KPICDValue *)theValue;

@end

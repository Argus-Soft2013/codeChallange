//
//  KPIValue.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KPICurrency, KPITimePeriod;

@interface KPIValue : NSObject

@property (strong, nonatomic) KPICurrency *amountInAggregationCurrency;
@property (strong, nonatomic) KPITimePeriod *timePeriod;
@property (strong, nonatomic) NSNumber *quantity;

@end

//
//  KPISurroundingPeriodData.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KPIValue, KPITimePeriod, KPICDSurroundingPeriodData;

@interface KPISurroundingPeriodData : NSObject

@property (nonatomic, strong) KPIValue *maxValue;
@property (nonatomic, strong) KPIValue *minValue;
@property (nonatomic, strong) KPIValue *avgValue;
@property (nonatomic, strong) KPITimePeriod *timePeriod;

-(instancetype)initWithSurroundingPeriodData:(KPICDSurroundingPeriodData *)surroundingPeriodData;

@end

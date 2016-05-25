//
//  KPISurroundingPeriodData.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPISurroundingPeriodData.h"
#import "KPICDSurroundingPeriodData.h"
#import "KPIValue.h"
#import "KPITimePeriod.h"

@interface KPISurroundingPeriodData ()
{
    KPICDSurroundingPeriodData *_surroundingPeriodData;
}

@end

@implementation KPISurroundingPeriodData

-(instancetype)initWithSurroundingPeriodData:(KPICDSurroundingPeriodData *)surroundingPeriodData
{
    self = [super init];
    if (self) {
        _surroundingPeriodData = surroundingPeriodData;
        self.minValue = [[KPIValue alloc] initWithValue:_surroundingPeriodData.minValue];
        self.maxValue = [[KPIValue alloc] initWithValue:_surroundingPeriodData.maxValue];
        self.avgValue = [[KPIValue alloc] initWithValue:_surroundingPeriodData.avgValue];
        self.timePeriod = [[KPITimePeriod alloc] initWithTimePeriod:_surroundingPeriodData.timePeriod];
    }
    return self;
}

//==============================================================================




@end

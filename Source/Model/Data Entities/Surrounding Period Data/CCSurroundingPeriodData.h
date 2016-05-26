//
//  CCSurroundingPeriodData.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCValue.h"
#import "CCTimePeriod.h"

@interface CCSurroundingPeriodData : NSObject<NSCopying, NSCoding>

@property (nonatomic, strong) CCValue *maxValue;
@property (nonatomic, strong) CCValue *minValue;
@property (nonatomic, strong) CCValue *avgValue;
@property (nonatomic, strong) CCTimePeriod *timePeriod;

- (BOOL)isEqualToSurroundingPeriodData:(CCSurroundingPeriodData *)theSurroundingPeriodData;

@end

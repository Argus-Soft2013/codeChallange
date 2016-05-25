//
//  KPITimePeriod.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KPICDTimePeriod;

@interface KPITimePeriod : NSObject

@property (nonatomic, strong) NSString *sliceUnit;
@property (nonatomic, strong) NSNumber *sliceUnitCount;
@property (nonatomic, strong) NSNumber *sliceCount;
@property (nonatomic, strong) NSDate *periodEnd;

-(instancetype)initWithTimePeriod:(KPICDTimePeriod *)timePeriod;


@end

//
//  KPITimePeriod.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPITimePeriod.h"
#import "KPICDTimePeriod.h"
#import "CoreDataManager.h"

@interface KPITimePeriod ()
{
    KPICDTimePeriod *_timePeriod;
}
@end

//==============================================================================

@implementation KPITimePeriod

-(instancetype)initWithTimePeriod:(KPICDTimePeriod *)timePeriod
{
    self = [super init];
    if (self) {
        _timePeriod = timePeriod;
    }
    
    return self;
}


//==============================================================================


-(NSString *)sliceUnit
{
    return _timePeriod.sliceUnit;
}

//==============================================================================


-(void)setSliceUnit:(NSString *)sliceUnit
{
    _timePeriod.sliceUnit = sliceUnit;
    [[CoreDataManager shared] saveContext];
}

//==============================================================================


-(NSNumber *)sliceCount
{
    return _timePeriod.sliceCount;
}


//==============================================================================


-(void)setSliceCount:(NSNumber *)sliceCount
{
    _timePeriod.sliceCount = sliceCount;
    [[CoreDataManager shared] saveContext];
}


//==============================================================================


-(NSNumber *)sliceUnitCount
{
    return _timePeriod.sliceUnitCount;
}

//==============================================================================


-(void)setSliceUnitCount:(NSNumber *)sliceUnitCount
{
    _timePeriod.sliceUnitCount = sliceUnitCount;
    [[CoreDataManager shared] saveContext];
}

@end

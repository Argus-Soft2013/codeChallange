//
//  KPIEntity.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPIEntity.h"
#import "KPICDEntity.h"
#import "KPIValue.h"
#import "KPISurroundingPeriodData.h"
#import "CoreDataManager.h"

@interface KPIEntity ()
{
    KPICDEntity *_enity;
}
@end

@implementation KPIEntity

-(instancetype)initWithKPICDEnity:(KPICDEntity *)entity
{
    self = [super init];
    if (self) {
        _enity = entity;
        self.kpiValue = [[KPIValue alloc]initWithValue:_enity.kpiValue];
        self.surroundingPeriodData = [[KPISurroundingPeriodData alloc] initWithSurroundingPeriodData:_enity.surroundingPeriodData];
    }
    
    return self;
}


//==============================================================================


-(NSString *)code
{
    return _enity.code;
}


//==============================================================================


-(void)setCode:(NSString *)code
{
    _enity.code = code;
    
    [[CoreDataManager shared] saveContext];
}


//==============================================================================


-(NSString *)label
{
    return _enity.label;
}


//==============================================================================


-(void)setLabel:(NSString *)label
{
    _enity.label = label;
    [[CoreDataManager shared] saveContext];
}

//==============================================================================


-(BOOL)isDeleted
{
    return _enity.deleted.boolValue;
}


//==============================================================================


-(void)setDeleted:(BOOL)deleted
{
    _enity.deleted = @(deleted);
    [[CoreDataManager shared] saveContext];
}

//==============================================================================


-(BOOL)deleted
{
    return _enity.deleted.boolValue;
}

@end

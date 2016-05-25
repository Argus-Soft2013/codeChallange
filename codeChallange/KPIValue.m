//
//  KPIValue.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPIValue.h"
#import "KPICDValue.h"
#import "CoreDataManager.h"
#import "KPITimePeriod.h"
#import "KPICurrency.h"

@interface KPIValue ()
{
    KPICDValue *_value;
}
@end

@implementation KPIValue

-(instancetype)initWithValue:(KPICDValue *)value
{
    self = [super init];
    if (self) {
        _value = value;
        self.timePeriod = [[KPITimePeriod alloc]initWithTimePeriod:_value.timePeriod];
        self.amountInAggregationCurrency = [[KPICurrency alloc] initWithCurrency:_value.amountInAggregationCurrency];
    }
    
    return self;
}


//==============================================================================


-(NSNumber *)quantity
{
    return _value.quantity;
}


//==============================================================================


-(void)setQuantity:(NSNumber *)quantity
{
    _value.quantity = quantity;
    [[CoreDataManager shared] saveContext];
}

@end

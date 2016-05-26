//
//  KPICurrency.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPICurrency.h"
#import "KPICDCurrency.h"
#import "CoreDataManager.h"

@interface KPICurrency ()
{
    KPICDCurrency *_currency;
}
@end

@implementation KPICurrency

-(instancetype)initWithCurrency:(KPICDCurrency *)currency
{
    self = [super init];
    if (self) {
        _currency = currency;
    }
    
    return self;
}


//==============================================================================


-(NSString *)unit
{
    return _currency.unit;
}


//==============================================================================

-(void)setUnit:(NSString *)unit
{
    _currency.unit = unit;
    [[CoreDataManager shared] saveContext];
}


//==============================================================================


-(NSNumber *)value
{
    return _currency.value;
}


//==============================================================================


-(void)setValue:(NSNumber *)value
{
    _currency.value = value;
    [[CoreDataManager shared] saveContext];
}
@end

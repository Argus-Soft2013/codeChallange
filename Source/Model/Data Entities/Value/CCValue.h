//
//  CCValue.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCCurrency.h"
#import "CCTimePeriod.h"

@interface CCValue : NSObject<NSCopying, NSCoding>

@property(nonatomic, strong) CCCurrency *amountInAggregationCurrency;
@property(nonatomic, strong) CCTimePeriod *timePeriod;
@property(nonatomic, strong) NSNumber *quantity;

- (BOOL)isEqualToValue:(CCValue *)theValue;

@end

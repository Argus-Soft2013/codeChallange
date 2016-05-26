//
//  KPICurrency.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KPICDCurrency;

@interface KPICurrency : NSObject

@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSNumber *value;

-(instancetype)initWithCurrency:(KPICDCurrency *)currency;

@end

//
//  CCCurrency.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCCurrency : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString *unit;
@property (nonatomic, strong) NSNumber *value;

- (BOOL)isEqualToCurrency:(CCCurrency *)theCurrency;

@end

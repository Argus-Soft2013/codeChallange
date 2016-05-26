//
//  TCPAHash.h
//  TradeCPAMobile
//
//  Created by Dmitriy Agalakov on 7/15/15.
//  Copyright (c) 2015 NIX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPIHash : NSObject


- (NSString *)hashWithString:(NSString *)input;
- (NSString *)hashForLoginWithString:(NSString *)input;

@end

//
//  NSDictionary+CheckNSNull.h
//  membership-ios
//
//  Created by Dmitry Krasulya on 11/25/15.
//  Copyright © 2015 Dmitry Krasulya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CheckNSNull)

+ (NSDictionary *)checkNSNull:(id)value;

+ (NSDictionary *)checkNil:(id)value;

+ (BOOL)isDictionaryEmpty:(id)value;

@end

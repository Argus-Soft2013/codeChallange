//
//  NSString+CheckNSNull.h
//  Conference Konnect
//
//  Created by Iraklii Tavadze on 01.07.14.
//  Copyright (c) 2014 Design and Test Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CheckNSNull)

+ (NSString *)checkNSNull:(id)value;

+ (NSString *)checkNil:(id)value;

@end

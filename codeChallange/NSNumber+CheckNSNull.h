//
//  NSNumber+CheckNSNull.h
//  bizi-baza
//
//  Created by krasylnikov on 5/1/15.
//  Copyright (c) 2015 Design and Test Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber(_CheckNSNull)

/// Check if the NSNumber is NULL. Return @0 instead.
+ (NSNumber *)checkNSNull:(id)value;

- (NSString *)stringBoolean;

@end

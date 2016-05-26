//
//  CCHash.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCHash : NSObject

+ (NSString *)hashWithString:(NSString *)input;
+ (NSString *)hashForLoginWithString:(NSString *)input;

@end

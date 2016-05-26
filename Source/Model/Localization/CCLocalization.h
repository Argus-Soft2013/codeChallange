//
//  CCLocalization.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const CCLocalizationTableDefaultName;

#define CCLocalizedString(key) [CCLocalization localizedStringForKey:key]

@interface CCLocalization : NSObject

+ (NSString *)localizedStringForKey:(NSString *)theKey;

@end

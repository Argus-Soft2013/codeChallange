//
//  CCBaseCommand+Utility.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCModelDefines.h"

#define CC_VALID_FROM_JSON(obj) (([obj isKindOfClass:[NSNull class]]) ? nil : obj)

@interface CCBaseCommand (Utility)

- (CCActivityStatus)activityStatusFromString:(NSString *)theString;

@end

//
//  CCBaseCommand+Utility.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCBaseCommand+Utility.h"

static NSString *const CCBaseCommandActivityStatusActive = @"active";
static NSString *const CCBaseCommandActivityStatusDisabled = @"disabled";

@implementation CCBaseCommand (Utility)

- (CCActivityStatus)activityStatusFromString:(NSString *)theString
{
    if (theString == nil)
    {
        return CCActivityStatusUnknown;
    }
    
    if ([theString isEqualToString:CCBaseCommandActivityStatusActive])
    {
        return CCActivityStatusActive;
    }
    
    if ([theString isEqualToString:CCBaseCommandActivityStatusDisabled])
    {
        return CCActivityStatusDisabled;
    }
    
    return CCActivityStatusUnknown;
}

@end

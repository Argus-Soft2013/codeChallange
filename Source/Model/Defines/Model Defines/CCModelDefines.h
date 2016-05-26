//
//  CCModelDefines.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCBaseCommand.h"

#pragma mark - Common

typedef NS_ENUM(NSInteger, CCActivityStatus)
{
    CCActivityStatusUnknown = -1,
    CCActivityStatusActive = 0,
    CCActivityStatusDisabled
};

#pragma mark - Query

typedef NS_ENUM(NSInteger, CCQuerySortDirection)
{
    CCQuerySortDirectionAscending = 0,
    CCQuerySortDirectionDescending
};

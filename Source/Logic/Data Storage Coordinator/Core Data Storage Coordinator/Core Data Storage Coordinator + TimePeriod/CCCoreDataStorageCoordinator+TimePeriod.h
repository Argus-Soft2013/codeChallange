//
//  CCCoreDataStorageCoordinator+TimePeriod.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCCoreDataStorageCoordinator.h"

@class CCFetchResult;

@interface CCCoreDataStorageCoordinator (TimePeriod)

/**
 *  @param theTimePeriods         Array of |CCTimePeriod|
 */
- (BOOL)cc_insertTimePeriods:(NSArray *)theTimePeriods
                   inContext:(NSManagedObjectContext *)theContext
               progressBlock:(CCDataStorageProgressBlock)theProgressBlock
                       error:(NSError **)theError;

#pragma mark - Query

- (CCFetchResult *)cc_getTimePeriodsWithInContext:(NSManagedObjectContext *)theContext
                                            error:(NSError **)theError;

#pragma mark - Update

/**
 *  @param theTimePeriods   Array of |CCTimePeriod|
 */
- (BOOL)cc_updateTimePeriods:(NSArray *)theTimePeriods
                   inContext:(NSManagedObjectContext *)theContext
                       error:(NSError **)theError;

/**
 *  @param theContact   |CCTimePeriod|
 */
- (BOOL)cc_updateCurrentTimePeriod:(id)theTimePeriod
                         inContext:(NSManagedObjectContext *)theContext
                             error:(NSError **)theError;

@end

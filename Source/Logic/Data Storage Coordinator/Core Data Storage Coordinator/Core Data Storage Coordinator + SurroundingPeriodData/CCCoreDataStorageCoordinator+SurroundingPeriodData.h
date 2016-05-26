//
//  CCCoreDataStorageCoordinator+SurroundingPeriodData.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCCoreDataStorageCoordinator.h"

@class CCFetchResult;

@interface CCCoreDataStorageCoordinator (SurroundingPeriodData)

/**
 *  @param theSurroundingPeriodDatas         Array of |CCSurroundingPeriodData|
 */
- (BOOL)cc_insertSurroundingPeriodDatas:(NSArray *)theSurroundingPeriodDatas
                              inContext:(NSManagedObjectContext *)theContext
                          progressBlock:(CCDataStorageProgressBlock)theProgressBlock
                                  error:(NSError **)theError;

#pragma mark - Query

- (CCFetchResult *)cc_getSurroundingPeriodDatasWithInContext:(NSManagedObjectContext *)theContext
                                                       error:(NSError **)theError;

#pragma mark - Update

/**
 *  @param theSurroundingPeriodDatas   Array of |CCSurroundingPeriodData|
 */
- (BOOL)cc_updateSurroundingPeriodDatas:(NSArray *)theSurroundingPeriodDatas
                              inContext:(NSManagedObjectContext *)theContext
                                  error:(NSError **)theError;

/**
 *  @param theContact   |CCSurroundingPeriodData|
 */
- (BOOL)cc_updateCurrentSurroundingPeriodData:(id)theSurroundingPeriodData
                                    inContext:(NSManagedObjectContext *)theContext
                                        error:(NSError **)theError;

@end

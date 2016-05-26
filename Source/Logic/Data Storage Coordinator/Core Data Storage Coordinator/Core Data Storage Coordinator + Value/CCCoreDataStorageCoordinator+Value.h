//
//  CCCoreDataStorageCoordinator+Value.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCCoreDataStorageCoordinator.h"

@class CCFetchResult;

@interface CCCoreDataStorageCoordinator (Value)

/**
 *  @param theValues         Array of |CCValue|
 */
- (BOOL)cc_insertValues:(NSArray *)theValues
              inContext:(NSManagedObjectContext *)theContext
          progressBlock:(CCDataStorageProgressBlock)theProgressBlock
                  error:(NSError **)theError;

#pragma mark - Query

- (CCFetchResult *)cc_getValuesWithInContext:(NSManagedObjectContext *)theContext
                                       error:(NSError **)theError;

#pragma mark - Update

/**
 *  @param theValues   Array of |CCValue|
 */
- (BOOL)cc_updateValues:(NSArray *)theValues
              inContext:(NSManagedObjectContext *)theContext
                  error:(NSError **)theError;

/**
 *  @param theContact   |CCValue|
 */
- (BOOL)cc_updateCurrentValue:(id)theValue
                    inContext:(NSManagedObjectContext *)theContext
                        error:(NSError **)theError;

@end

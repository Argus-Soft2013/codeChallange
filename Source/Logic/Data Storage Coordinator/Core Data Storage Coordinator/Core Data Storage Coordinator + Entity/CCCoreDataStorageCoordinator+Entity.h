//
//  CCCoreDataStorageCoordinator+Entity.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCCoreDataStorageCoordinator.h"

@class CCFetchResult;

@interface CCCoreDataStorageCoordinator (Entity)

/**
 *  @param theEntites         Array of |CCEntity|
 */
- (BOOL)cc_insertEntites:(NSArray *)theEntites
               inContext:(NSManagedObjectContext *)theContext
           progressBlock:(CCDataStorageProgressBlock)theProgressBlock
                   error:(NSError **)theError;

#pragma mark - Query

- (CCFetchResult *)cc_getEntitesWithInContext:(NSManagedObjectContext *)theContext
                                        error:(NSError **)theError;

#pragma mark - Update

/**
 *  @param theEntites   Array of |CCEntity|
 */
- (BOOL)cc_updateEntites:(NSArray *)theEntites
               inContext:(NSManagedObjectContext *)theContext
                   error:(NSError **)theError;

/**
 *  @param theContact   |CCEntity|
 */
- (BOOL)cc_updateCurrentEntity:(id)theEntity
                     inContext:(NSManagedObjectContext *)theContext
                         error:(NSError **)theError;

@end

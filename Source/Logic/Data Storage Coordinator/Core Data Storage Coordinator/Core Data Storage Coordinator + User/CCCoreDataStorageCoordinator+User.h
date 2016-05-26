//
//  CCCoreDataStorageCoordinator+User.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCCoreDataStorageCoordinator.h"

@class CCFetchResult;

@interface CCCoreDataStorageCoordinator (User)

/**
 *  @param theUsers         Array of |CCUser|
 */
- (BOOL)cc_insertUsers:(NSArray *)theUsers
             inContext:(NSManagedObjectContext *)theContext
         progressBlock:(CCDataStorageProgressBlock)theProgressBlock
                 error:(NSError **)theError;

#pragma mark - Query

- (CCFetchResult *)cc_getUsersWithInContext:(NSManagedObjectContext *)theContext
                                      error:(NSError **)theError;

#pragma mark - Update

/**
 *  @param theUsers   Array of |CCUser|
 */
- (BOOL)cc_updateUsers:(NSArray *)theUsers
             inContext:(NSManagedObjectContext *)theContext
                 error:(NSError **)theError;

/**
 *  @param theContact   |CCUser|
 */
- (BOOL)cc_updateCurrentUser:(id)theUser
                   inContext:(NSManagedObjectContext *)theContext
                       error:(NSError **)theError;

@end

//
//  CCCoreDataStorageCoordinator+Currency.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCCoreDataStorageCoordinator.h"

@class CCFetchResult;

@interface CCCoreDataStorageCoordinator (Currency)

#pragma mark - Batch

/**
 *  @param theCurrences         Array of |CCCurrency|
 */
- (BOOL)cc_insertCurrences:(NSArray *)theCurrences
                 inContext:(NSManagedObjectContext *)theContext
             progressBlock:(CCDataStorageProgressBlock)theProgressBlock
                     error:(NSError **)theError;

#pragma mark - Query

- (CCFetchResult *)cc_getCurrencesWithInContext:(NSManagedObjectContext *)theContext
                                          error:(NSError **)theError;

#pragma mark - Update

/**
 *  @param theCurrences   Array of |CCCurrency|
 */
- (BOOL)cc_updateCurrences:(NSArray *)theCurrences
                 inContext:(NSManagedObjectContext *)theContext
                     error:(NSError **)theError;

/**
 *  @param theContact   |CCCurrency|
 */
- (BOOL)cc_updateCurrentCurrency:(id)theCurrency
                       inContext:(NSManagedObjectContext *)theContext
                           error:(NSError **)theError;


@end

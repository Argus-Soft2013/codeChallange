//
//  CCCoreDataStorageCoordinator+Currency.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCCoreDataStorageCoordinator+Currency.h"
#import "CCCoreDataStorageCoordinator_Private.h"

#import "KPICDCurrency.h"
#import "CCCurrency.h"

@implementation CCCoreDataStorageCoordinator (Currency)

#pragma mark - Batch

- (BOOL)cc_insertCurrences:(NSArray *)theCurrences
                 inContext:(NSManagedObjectContext *)theContext
             progressBlock:(CCDataStorageProgressBlock)theProgressBlock
                     error:(NSError **)theError
{
    NSArray *fetchedItems = [self cc_fetchCurrencesForEntities:theCurrences fromContext:theContext error:theError];
    
    if (fetchedItems == nil)
    {
        return NO;
    }
    
    NSArray *fetchedItemsIDs = [fetchedItems valueForKey:NSStringFromSelector(@selector(userID))];
    
    NSString *entityName = NSStringFromClass([KPICDCurrency class]);
    BOOL isSuccess = YES;
    
    for (id entity in theCurrences)
    {
        isSuccess = [self cc_updateCarencyValues:itemToUpdate
                                        fromUser:entity
                                       inContext:theContext
                                           error:theError];
        
        if (theProgressBlock != NULL)
        {
            theProgressBlock(itemID, isSuccess);
        }
    }
    
    return YES;
}

#pragma mark - Query

- (CCFetchResult *)cc_getCurrencesWithInContext:(NSManagedObjectContext *)theContext
                                          error:(NSError **)theError
{
    NSMutableArray *predicates = [NSMutableArray array];
    
    NSFetchRequest *request = [self fetchRequestForClass:[KPICDCurrency class] predicates:predicates];
    
    return [self fetchResultWithRequest:request inContext:theContext error:theError];
}

#pragma mark - Update

- (BOOL)cc_updateCurrences:(NSArray *)theCurrences
                 inContext:(NSManagedObjectContext *)theContext
                     error:(NSError **)theError
{
    
}


- (BOOL)cc_updateCurrentCurrency:(id)theCurrency
                       inContext:(NSManagedObjectContext *)theContext
                           error:(NSError **)theError
{
    return [self cc_updateCurrences:theCurrency
                          targetkey:NSStringFromSelector(@selector(currenc))
                          inContext:theContext
                              error:theError];
    
    if (theCurrency == nil)
    {
        KPICDCurrency *obsoleteCurrency = [theAccount currentUser];
        [theAccount setCurrentUser:nil];
        [self tcpa_vacuumUserIfNeeded:obsoleteUser inContext:theContext];
        
        return YES;
    }
}

@end

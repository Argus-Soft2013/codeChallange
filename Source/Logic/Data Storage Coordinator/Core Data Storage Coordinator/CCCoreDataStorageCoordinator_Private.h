//
//  CCCoreDataStorageCoordinator_Private.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCCoreDataStorageCoordinator.h"
#import "CCCoreDataObjectMapper.h"
#import "CCFetchResult.h"

@class NSFetchRequest;

@interface CCCoreDataStorageCoordinator ()

@property(nonatomic, strong, readonly) CCCoreDataObjectMapper *objectMapper;

- (BOOL)saveContextToStore:(NSManagedObjectContext *)theContext error:(NSError **)theError;

- (NSFetchRequest *)fetchRequestForClass:(Class)theClass
                              predicates:(NSArray *)thePredicates;

- (CCFetchResult *)fetchResultWithRequest:(NSFetchRequest *)theRequest
                                inContext:(NSManagedObjectContext *)theContext
                                    error:(NSError **)theError;

@end

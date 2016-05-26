//
//  CCCoreDataStorageCoordinator.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCCoreDataStorageCoordinator.h"
#import "CCCoreDataStorageCoordinator_Private.h"
#import "CCCoreDataStorageCoordinator+Currency.h"
#import "CCCoreDataStorageCoordinator+Entity.h"
#import "CCCoreDataStorageCoordinator+SurroundingPeriodData.h"
#import "CCCoreDataStorageCoordinator+TimePeriod.h"
#import "CCCoreDataStorageCoordinator+User.h"
#import "CCCoreDataStorageCoordinator+Value.h"

#import "KPICDUser.h"
#import "KPICDSurroundingPeriodData.h"
#import "KPICDTimePeriod.h"
#import "KPICDValue.h"
#import "KPICDCurrency.h"
#import "KPICDEntity.h"

#import <CoreData/CoreData.h>
#import <KCOrderedAccessorFix/NSManagedObjectModel+KCOrderedAccessorFix.h>

@interface CCCoreDataStorageCoordinator ()

@property(nonatomic, strong) NSManagedObjectModel *objectModel;
@property(nonatomic, strong) NSPersistentStoreCoordinator *storeCoordinator;

@property(nonatomic, strong) NSManagedObjectContext *objectPrivateContext;

/**
 *  Creates on demand
 */
@property(nonatomic, strong) NSManagedObjectContext *objectBatchContext;

@property(nonatomic, strong) CCUser *prefetchedUser;

@end

@implementation CCCoreDataStorageCoordinator

#pragma mark - Memory management

- (instancetype)init
{
    return [self initWithDataMapper:[[CCCoreDataObjectMapper alloc] init]];
}

- (instancetype)initWithDataMapper:(CCCoreDataObjectMapper *)theMapper
{
    self = [super init];
    
    if (self != nil)
    {
        _objectMapper = theMapper;
        [self cofigureStorage];
    }
    
    return self;
}

- (void)dealloc
{
    [self stopObservingContexts];
}

#pragma mark - Core Data Stack

- (NSString *)modelFileName
{
    static NSString *const StorageModelName = @"RepositoryModel";
    
    return StorageModelName;
}

- (NSURL *)storageDirectory
{
    static NSString *const StorageSubdirectory = @"RepositoryModel";
    NSURL *libraryDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSURL *directoryURL = [libraryDirectory URLByAppendingPathComponent:StorageSubdirectory];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[directoryURL absoluteString]])
    {
        NSError *error = nil;
        [[NSFileManager defaultManager] createDirectoryAtURL:directoryURL
                                 withIntermediateDirectories:YES
                                                  attributes:nil
                                                       error:&error];
    }
    
    return directoryURL;
}

- (void)cofigureStorage
{
    [self configureStorageModel];
    [self configureStoreCoordinator];
    [self configureObjectContexts];
}

- (void)configureStorageModel
{
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:@[[NSBundle bundleForClass:[self class]]]];
    [model kc_generateOrderedSetAccessors];
    [self setObjectModel:model];
    
    if (model == nil)
    {
        NSLog(@"ERROR: INVALID OBJECT MODEL");
        return;
    }
}

- (void)configureStoreCoordinator
{
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self objectModel]];
    [self setStoreCoordinator:coordinator];
    
    static NSString *const SQLiteStoreExtension = @"sqlite";
    NSString *storeFileName = [[self modelFileName] stringByAppendingPathExtension:SQLiteStoreExtension];
    NSURL *storeURL = [[self storageDirectory] URLByAppendingPathComponent:storeFileName];
    
    [self addPersistentStoreWithWithURL:storeURL];
}

- (BOOL)addPersistentStoreWithWithURL:(NSURL *)theStoreURL
{
    if (theStoreURL == nil)
    {
        return NO;
    }
    
    NSError *error = nil;
    NSPersistentStore *store = [[self storeCoordinator] addPersistentStoreWithType:NSSQLiteStoreType
                                                                     configuration:nil
                                                                               URL:theStoreURL
                                                                           options:@{
                                                                                     NSMigratePersistentStoresAutomaticallyOption : @(YES),
                                                                                     NSInferMappingModelAutomaticallyOption : @(YES)
                                                                                     }
                                                                             error:&error];
    BOOL isSuccess = (store != nil);
    
    if (!isSuccess)
    {
        NSLog(@"ERROR: UNABLE TO ADD PERSISTENT STORE (%@)", error);
    }
    
    return isSuccess;
}

- (void)configureObjectContexts
{
    NSManagedObjectContext *privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [privateContext setPersistentStoreCoordinator:[self storeCoordinator]];
    [self setObjectPrivateContext:privateContext];
    
    [self startObservingPrivateContext];
}

- (NSManagedObjectContext *)workerContextForBatchOperation
{
    if ([self objectBatchContext] != nil)
    {
        return [self objectBatchContext];
    }
    
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [context setPersistentStoreCoordinator:[self storeCoordinator]];
    [self setObjectBatchContext:context];
    
    [self startObservingWorkerContext];
    
    return context;
}

#pragma mark - Observation

- (void)startObservingWorkerContext
{
    if ([self objectBatchContext] == nil)
    {
        return;
    }
    
    /*
     You can pass the notification object to mergeChangesFromContextDidSaveNotification: on another thread, however you must not use the managed object in the user info dictionary directly on another thread
     */
    
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [[NSNotificationCenter defaultCenter] addObserverForName:NSManagedObjectContextDidSaveNotification
                                                      object:[self objectBatchContext]
                                                       queue:backgroundQueue
                                                  usingBlock:^(NSNotification *note)
                                                    {
                                                        __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
                                                        [[strongSelf objectPrivateContext] performBlock:^
                                                        {
                                                            [[strongSelf objectPrivateContext] mergeChangesFromContextDidSaveNotification:note];
                                                        }];
                                                    }];
}

- (void)startObservingPrivateContext
{
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [[NSNotificationCenter defaultCenter] addObserverForName:NSManagedObjectContextDidSaveNotification
                                                      object:[self objectPrivateContext]
                                                       queue:backgroundQueue
                                                  usingBlock:^(NSNotification *note)
                                                    {
                                                        if ([weakSelf objectBatchContext] == nil)
                                                        {
                                                            return;
                                                        }
         
                                                        __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
                                                        [[strongSelf objectBatchContext] performBlock:^
                                                         {
                                                             [[strongSelf objectBatchContext] mergeChangesFromContextDidSaveNotification:note];
                                                         }];
                                                    }];
}

- (void)stopObservingContexts
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NSManagedObjectContextDidSaveNotification
                                                  object:nil];
}

#pragma mark - CCDataStorageCoordinator

- (BOOL)purgeStorageContentWithError:(NSError * __autoreleasing *)theError
{
    @synchronized(self)
    {
        [[self objectPrivateContext] processPendingChanges];
        [[self objectBatchContext] processPendingChanges];
        
        NSArray *attachedStores = [[self storeCoordinator] persistentStores];
        NSMutableArray *deatachedStoreURLs = [NSMutableArray arrayWithCapacity:[attachedStores count]];
        
        for (NSPersistentStore *store in attachedStores)
        {
            NSURL *storeURL = [store URL];
            BOOL isSuccess = [[self storeCoordinator] removePersistentStore:store error:theError];
            
            if (isSuccess)
            {
                isSuccess = [[NSFileManager defaultManager] removeItemAtURL:storeURL error:theError];
                
                if (isSuccess)
                {
                    [deatachedStoreURLs addObject:storeURL];
                }
                else
                {
                    return NO;
                }
            }
            else
            {
                return NO;
            }
        }
        
        for (NSURL *storeURL in deatachedStoreURLs)
        {
            [self addPersistentStoreWithWithURL:storeURL];
        }
    }
    
    return YES;
}

#pragma mark - CCDataStorageBatchUpdateProtocol

- (void)saveBatchedChanges
{
    [self saveContextToStore:[self objectBatchContext] error:NULL];
    [self prefetchUser];
}

- (BOOL)performBatchedInsertOfAccounts:(NSArray<CCUser *> *)theUser
                     withProgressBlock:(CCDataStorageProgressBlock)theProgressBlock
                                 error:(NSError * __autoreleasing *)theError
{
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    return [self performBatchedUpdateWithBlock:^BOOL (NSManagedObjectContext *theContext)
            {
                __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
                return [strongSelf cc_insertUsers:theUser
                                        inContext:theContext
                                    progressBlock:theProgressBlock
                                            error:theError];
            }];
}

- (BOOL)performBatchedInsertOfCurrency:(NSArray<CCCurrency *> *)theCurrency
                     withProgressBlock:(CCDataStorageProgressBlock)theProgressBlock
                                 error:(NSError * __autoreleasing *)theError
{
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    return [self performBatchedUpdateWithBlock:^BOOL (NSManagedObjectContext *theContext)
            {
                __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
                return [strongSelf cc_insertCurrences:theCurrency
                                            inContext:theContext
                                        progressBlock:theProgressBlock
                                                error:theError];
            }];
}

- (BOOL)performBatchedInsertOfEntity:(NSArray<CCEntity *> *)theEntity
                   withProgressBlock:(CCDataStorageProgressBlock)theProgressBlock
                               error:(NSError * __autoreleasing *)theError
{
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    return [self performBatchedUpdateWithBlock:^BOOL (NSManagedObjectContext *theContext)
            {
                __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
                return [strongSelf cc_insertEntites:theEntity
                                          inContext:theContext
                                      progressBlock:theProgressBlock
                                              error:theError];
            }];
}

- (BOOL)performBatchedInsertOfSurroundingPeriodData:(NSArray<CCSurroundingPeriodData *> *)theSurroundingPeriodData
                                  withProgressBlock:(CCDataStorageProgressBlock)theProgressBlock
                                              error:(NSError * __autoreleasing *)theError
{
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    return [self performBatchedUpdateWithBlock:^BOOL (NSManagedObjectContext *theContext)
            {
                __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
                return [strongSelf cc_insertSurroundingPeriodDatas:theSurroundingPeriodData
                                                         inContext:theContext
                                                     progressBlock:theProgressBlock
                                                             error:theError];
            }];
}

- (BOOL)performBatchedInsertOfTimePeriod:(NSArray<CCTimePeriod *> *)theTimePeriod
                       withProgressBlock:(CCDataStorageProgressBlock)theProgressBlock
                                   error:(NSError * __autoreleasing *)theError
{
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    return [self performBatchedUpdateWithBlock:^BOOL (NSManagedObjectContext *theContext)
            {
                __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
                return [strongSelf cc_insertTimePeriods:theTimePeriod
                                              inContext:theContext
                                          progressBlock:theProgressBlock
                                                  error:theError];
            }];
}

- (BOOL)performBatchedInsertOfValue:(NSArray<CCValue *> *)theValue
                  withProgressBlock:(CCDataStorageProgressBlock)theProgressBlock
                              error:(NSError * __autoreleasing *)theError
{
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    return [self performBatchedUpdateWithBlock:^BOOL (NSManagedObjectContext *theContext)
            {
                __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
                return [strongSelf cc_insertValues:theValue
                                         inContext:theContext
                                     progressBlock:theProgressBlock
                                             error:theError];
            }];
}

#pragma mark - Private

- (void)prefetchUser
{
    __weak CCCoreDataStorageCoordinator *weakSelf = self;
    NSManagedObjectContext *actionContext = [self objectPrivateContext];
    [actionContext performBlockAndWait:^
     {
         __strong CCCoreDataStorageCoordinator *strongSelf = weakSelf;
         NSError *error = nil;
         CCFetchResult *fetchedUser = [self cc_getUsersWithInContext:actionContext
                                                               error:&error];
         
         if (fetchedUser == nil)
         {
             return;
         }
         
         CCUser *user = [[strongSelf objectMapper] userFromInternalUser:[[fetchedUser items] firstObject]];
         [strongSelf setPrefetchedUser:user];
     }];
}

- (BOOL)performBatchedUpdateWithBlock:(BOOL (^)(NSManagedObjectContext *theContext))theActionBlock
{
    if (theActionBlock == NULL)
    {
        return NO;
    }
    
    NSManagedObjectContext *context = [self workerContextForBatchOperation];
    __block BOOL isSuccess = NO;
    
    [context performBlockAndWait:^
     {
         isSuccess = theActionBlock(context);
     }];
    
    return isSuccess;
}

- (BOOL)saveContextToStore:(NSManagedObjectContext *)theContext error:(NSError **)theError
{
    __block NSError *localError = nil;
    NSManagedObjectContext *contextToSave = theContext;
    
    while (contextToSave != nil)
    {
        __block BOOL success;
        [contextToSave obtainPermanentIDsForObjects:[[contextToSave insertedObjects] allObjects] error:&localError];
        
        if (localError != nil)
        {
            if (theError != NULL)
            {
                *theError = localError;
            }
            
            return NO;
        }
        
        [contextToSave performBlockAndWait:^
         {
             success = [contextToSave save:&localError];
             
             if (!success && (localError == nil))
             {
                 NSLog(@"Saving of managed object context failed, but a `nil` value for the `error` argument was returned. This typically indicates an invalid implementation of a key-value validation method exists within your model. This violation of the API contract may result in the save operation being mis-interpretted by callers that rely on the availability of the error.");
             }
         }];
        
        if (!success)
        {
            if (theError != NULL)
            {
                *theError = localError;
            }
            
            return NO;
        }
        
        if (!contextToSave.parentContext &&
            (contextToSave.persistentStoreCoordinator == nil))
        {
            NSLog(@"Reached the end of the chain of nested managed object contexts without encountering a persistent store coordinator. Objects are not fully persisted.");
            
            return NO;
        }
        
        contextToSave = contextToSave.parentContext;
    }
    
    return YES;
}

- (NSFetchRequest *)fetchRequestForClass:(Class)theClass predicates:(NSArray *)thePredicates
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(theClass)];
    
    [request setReturnsObjectsAsFaults:NO];
    
    NSPredicate *resultPredicate = nil;
    
    if ([thePredicates count] > 1)
    {
        resultPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:thePredicates];
    }
    else
    {
        resultPredicate = [thePredicates firstObject];
    }
    
    [request setPredicate:resultPredicate];
    
    return request;
}

- (CCFetchResult *)fetchResultWithRequest:(NSFetchRequest *)theRequest
                                inContext:(NSManagedObjectContext *)theContext
                                    error:(NSError * __autoreleasing *)theError
{
    if (theRequest == nil)
    {
        return nil;
    }
    
    NSArray *resultItems = [theContext executeFetchRequest:theRequest error:theError];
    
    if (resultItems == nil)
    {
        return nil;
    }
    
    return [[CCFetchResult alloc] initWithItems:resultItems];
}

- (CCFetchResult *)fetchResultFromResult:(CCFetchResult *)theResult byReplacingWithMappedItems:(NSArray *)theItems
{
    return [[CCFetchResult alloc] initWithItems:theItems];
}

@end

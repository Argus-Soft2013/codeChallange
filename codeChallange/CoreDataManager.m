//
//  CoreDataManager.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CoreDataManager.h"
#import "KPICDEntity.h"
#import "KPICDValue.h"
#import "KPICDCurrency.h"
#import "KPICDSurroundingPeriodData.h"
#import "KPICDTimePeriod.h"

static CoreDataManager *manager = nil;

@implementation CoreDataManager


@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

//==============================================================================

#pragma mark - Init

//==============================================================================


+(instancetype)shared
{
    @synchronized(self)
    {
        if(manager == nil)
            manager = [[CoreDataManager alloc] init];
    }
    
    return manager;
}


//==============================================================================


-(instancetype)init
{
    self = [super init];
    
    if(self)
    {
        _managedObjectContext       = [self managedObjectContext];
        _managedObjectModel         = [self managedObjectModel];
        _persistentStoreCoordinator = [self persistentStoreCoordinator];
    }
    
    return self;
}


//==============================================================================

#pragma makr - Source Code

//==============================================================================


-(KPICDEntity *)newKPIEntity
{
    KPICDEntity *newKPIEntity = [NSEntityDescription insertNewObjectForEntityForName:kKPICDEntity inManagedObjectContext:self.managedObjectContext];
    [newKPIEntity initByDefault];
    
    
    [self saveContext];
    
    return newKPIEntity;

}


//==============================================================================


-(KPICDEntity *)kpiEntityWithCode:(NSString *)code
{
    NSParameterAssert(code.length);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.code == %@",code];
    
    return [self findAllEntityObjects:kKPICDEntity byPredicate:predicate sortDescriptors:nil].firstObject;
    
}


//==============================================================================


-(KPICDValue *)newKPIValue
{
    KPICDValue *newKPIValue = [NSEntityDescription insertNewObjectForEntityForName:kKPICDValue inManagedObjectContext:self.managedObjectContext];
    return newKPIValue;
}


//==============================================================================


-(KPICDSurroundingPeriodData *)newSurroundingPeriodData
{
    KPICDSurroundingPeriodData *newSurroundingPeriodData = [NSEntityDescription insertNewObjectForEntityForName:kKPICDSurroundingPeriodData inManagedObjectContext:self.managedObjectContext];
    return newSurroundingPeriodData;
}


//==============================================================================

#pragma mark - Fetching

//==============================================================================


- (NSArray *)findAllEntityObjects:(NSString *)entityName byPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    request.returnsObjectsAsFaults = NO;
    if (predicate)
        [request setPredicate:predicate];
    
    if (sortDescriptors.count > 0)
        request.sortDescriptors = sortDescriptors;
    
    NSError *e = nil;
    NSArray *s = [self.managedObjectContext executeFetchRequest:request error:&e];
    return (s.count && !e) ? s : nil;
}



//==============================================================================

#pragma mark - Core Data stack

//==============================================================================


- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "argus-soft.codeChallange" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


//==============================================================================


- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"codeChallange" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}


//==============================================================================


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"codeChallange.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


//==============================================================================



- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}


//==============================================================================

#pragma mark - Core Data Saving support

//==============================================================================


- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


@end

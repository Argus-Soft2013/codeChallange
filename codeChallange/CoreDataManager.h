//
//  CoreDataManager.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KPICDEntity, KPICDSurroundingPeriodData, KPICDValue, KPICDTimePeriod, KPICDCurrency;

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(instancetype)shared;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

-(KPICDEntity *)newKPIEntity;

-(KPICDEntity *)kpiEntityWithCode:(NSString *)code;

@end

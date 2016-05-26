//
//  KPICDUser+CoreDataProperties.h
//  
//
//  Created by DeMoN on 5/26/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KPICDUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPICDUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *login;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) KPICDEntity *kpiEntity;

@end

NS_ASSUME_NONNULL_END

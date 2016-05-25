//
//  KPICDEntity.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KPICDSurroundingPeriodData, KPICDValue;

NS_ASSUME_NONNULL_BEGIN

static NSString *kKPICDEntity = @"KPICDEntity";

@interface KPICDEntity : NSManagedObject


+(instancetype)entityWithDictionary:(NSDictionary *)dict;

-(void)initByDefault;

@end

NS_ASSUME_NONNULL_END

#import "KPICDEntity+CoreDataProperties.h"

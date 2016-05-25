//
//  DashboardTableViewDataSource.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)();
typedef void(^FailureBlock)(NSError *error, id responseObject);

@class KPIEntity;

@interface DashboardTableViewDataSource : NSObject

-(NSUInteger)numberOfItemsInSection:(NSUInteger)section;

-(KPIEntity *)itemForRow:(NSUInteger)row;

-(void)deletItemAtIndexPath:(NSIndexPath *)indexPath;

-(void)updateDataSourceWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure;

@end

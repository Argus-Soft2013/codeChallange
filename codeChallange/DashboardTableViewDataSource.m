//
//  DashboardTableViewDataSource.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "DashboardTableViewDataSource.h"
#import "KPIEntity.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "KPICDEntity.h"
#import "CoreDataManager.h"
#import "KPIEntity.h"

@interface DashboardTableViewDataSource()
{
    NSMutableArray <KPIEntity *> *_items;
}

@end

@implementation DashboardTableViewDataSource

-(instancetype)init
{
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
    }
    
    return self;
}


//==============================================================================


-(void)updateDataSourceWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure
{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://opx.cfapps.io/dashboarditems"]];
    request.HTTPMethod = @"GET";
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    NSString *authStr = [NSString stringWithFormat:@"%@:%@",@"iosdev/123e4567e89b12d3a456" , @""];
    NSData *authData = [authStr dataUsingEncoding:NSASCIIStringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error)
            failure(error,responseObject);
        else
        {
            for (NSDictionary *dict in responseObject) {
                [KPICDEntity kpiCDEntityWithDictionary:dict];
            }
            [[CoreDataManager shared] saveContext];
            
            [self updateItems];
            
            success();
        }
    }];
    
    [task resume];
}


//==============================================================================


-(NSUInteger)numberOfItemsInSection:(NSUInteger)section
{
    return _items.count;
}


//==============================================================================

-(KPIEntity *)itemForRow:(NSUInteger)row
{
    return _items[row];
}


//==============================================================================



-(void)deletItemAtIndexPath:(NSIndexPath *)indexPath
{
    _items[indexPath.row].deleted = YES;
    [self updateItems];
}


//==============================================================================


-(void)updateItems
{
    [_items removeAllObjects];
    
    for (KPICDEntity *entity in [[CoreDataManager shared] kpiNotDeletedItems]) {
        [_items addObject:[[KPIEntity alloc] initWithKPICDEnity:entity]];
    }

}


//==============================================================================





@end

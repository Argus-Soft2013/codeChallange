//
//  CCDashboardDataSource.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCDashboardDataSource.h"

@interface CCDashboardDataSource ()

@end

@implementation CCDashboardDataSource

#pragma mark - Load Method

- (void)reloadContentWithSuccessBlock:(CCDashboardSuccessBlock)theSuccessBlock
                         failureBlock:(CCDashboardFailureBlock)theFailureBlock
{
    __weak CCDashboardDataSource *weakSelf = self;
    
}

#pragma mark - Content

- (NSUInteger)countOfKPIItems
{
    return 10;
}

@end

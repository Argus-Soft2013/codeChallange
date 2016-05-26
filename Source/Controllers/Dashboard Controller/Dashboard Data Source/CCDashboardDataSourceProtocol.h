//
//  CCDashboardDataSourceProtocol.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

typedef void (^CCDashboardSuccessBlock)(BOOL success);
typedef void (^CCDashboardFailureBlock)(NSError *theError);

@protocol CCDashboardDataSourceProtocol <NSObject>

- (void)reloadContentWithSuccessBlock:(CCDashboardSuccessBlock)theSuccessBlock
                         failureBlock:(CCDashboardFailureBlock)theFailureBlock;

#pragma mark - Content

- (NSUInteger)countOfKPIItems;

@end

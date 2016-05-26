//
//  CCDashboardViewController.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCViewController.h"

@protocol CCDashboardDataSourceProtocol;

@interface CCDashboardViewController : CCViewController

- (void)reloadContent;

#pragma mark - Required dependencies

- (void)setContentDataSource:(id<CCDashboardDataSourceProtocol>)theDataSource;

@end

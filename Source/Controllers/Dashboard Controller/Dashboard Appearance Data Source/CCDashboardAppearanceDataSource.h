//
//  CCDashboardAppearanceDataSource.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCDashboardDataSourceProtocol;

@interface CCDashboardAppearanceDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithContentDataSource:(id<CCDashboardDataSourceProtocol>)theDataSource NS_DESIGNATED_INITIALIZER;

- (void)reloadData;

#pragma mark - Required dependencies

- (void)setDataSource:(id<CCDashboardDataSourceProtocol>)theDataSource;

@end

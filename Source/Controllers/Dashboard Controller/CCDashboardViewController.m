//
//  CCDashboardViewController.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCDashboardViewController.h"

#import "CCDashboardDataSourceProtocol.h"

#import "CCNavigationHeaderView.h"

#import "CCDashboardAppearanceDataSource.h"

@interface CCDashboardViewController ()

@property(nonatomic, weak) IBOutlet UITableView *tableView;
@property(nonatomic, weak) IBOutlet CCNavigationHeaderView *headerView;

@property(nonatomic, strong) IBOutlet CCDashboardAppearanceDataSource *appearanceDataSource;
@property(nonatomic, strong) id<CCDashboardDataSourceProtocol> contentDataSource;

@end

@implementation CCDashboardViewController

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupView];
    
    [self reloadData];
}

- (void)setupView
{
    [self setupHeaderView];
}

- (void)setupHeaderView
{
    [[self headerView] setHeaderTitle:CCLocalizedString(@"Dashboard.List.Header.Title")];
    [[self headerView] setLeftButtonTitle:CCLocalizedString(@"Dashboard.List.Header.Left.Button.Title") forState:UIControlStateNormal];
    [[self headerView] setLeftButtonTitle:CCLocalizedString(@"Dashboard.List.Header.Left.Button.Title") forState:UIControlStateHighlighted];
    [[self headerView] setRightButtonTitle:CCLocalizedString(@"Dashboard.List.Header.Right.Button.Title") forState:UIControlStateNormal];
    [[self headerView] setRightButtonTitle:CCLocalizedString(@"Dashboard.List.Header.Right.Button.Title") forState:UIControlStateHighlighted];
}

#pragma mark - Setter

- (void)setContentDataSource:(id<CCDashboardDataSourceProtocol>)theContentDataSource
{
    if (theContentDataSource != _contentDataSource)
    {
        _contentDataSource = theContentDataSource;
        [[self appearanceDataSource] setDataSource:theContentDataSource];
        [self reloadData];
    }
}

#pragma mark - Public

- (void)reloadContent
{
    [self reloadData];
}

- (void)reloadData
{
    if ([self isViewLoaded])
    {
        [[self appearanceDataSource] reloadData];
    }
}

#pragma mark - Actions

- (IBAction)logoutButtonDidClicked:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];
}

#pragma mark - CCNavigationBarAppearanceProtocol

- (CCNavigationBarApperanceStyle)preferredNavigationBarAppearanceStyle
{
    return CCNavigationBarApperanceStyleHidden;
}

@end

//
//  DashboardViewController.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardTableViewDataSource.h"
#import "CoreDataManager.h"
#import "KPICell.h"
#import "LoginVC.h"

@interface DashboardViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView *_tableView;
    DashboardTableViewDataSource *_dataSource;
}
@end

@implementation DashboardViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self presentViewController:[LoginVC new] animated:YES completion:nil];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _dataSource = [DashboardTableViewDataSource new];
    _tableView.allowsSelection = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"KPICell" bundle:nil] forCellReuseIdentifier:@"KPICell"];
}


//==============================================================================


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [_dataSource updateDataSourceWithSuccess:^{
        [_tableView reloadData];
    } failure:^(NSError *error, id responseObject) {
        
    }];
}



//==============================================================================


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KPICell *cell = (KPICell*)[tableView dequeueReusableCellWithIdentifier:@"KPICell"];
    KPIEntity *entity = [_dataSource itemForRow:indexPath.row];
    [cell updateWithKPIEntity:entity];
    return cell;
}


//==============================================================================

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//==============================================================================

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource numberOfItemsInSection:section];
}


//==============================================================================


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

//==============================================================================


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

//==============================================================================


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//==============================================================================


-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


//==============================================================================


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [_dataSource deletItemAtIndexPath:indexPath];
    [_tableView reloadData];
}


//==============================================================================

-(IBAction)logout:(id)sender
{
    [self presentViewController:[LoginVC new] animated:YES completion:nil];
}

@end

//
//  DeletedKPIsVCView.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "DeletedKPIsVCView.h"
#import "KPICell.h"
#import "DeletedDataSource.h"

@interface DeletedKPIsVCView ()<UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView *_tableView;
    DeletedDataSource *_deletedKPIsDataSource;
}

@end

@implementation DeletedKPIsVCView

- (void)viewDidLoad
{
    [super viewDidLoad];
    _deletedKPIsDataSource = [DeletedDataSource new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.allowsSelection = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [_tableView registerNib:[UINib nibWithNibName:@"KPICell" bundle:nil] forCellReuseIdentifier:@"KPICell"];
}



//==============================================================================


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KPICell *cell = (KPICell*)[tableView dequeueReusableCellWithIdentifier:@"KPICell"];
    KPIEntity *entity = [_deletedKPIsDataSource itemForRow:indexPath.row];
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
    return [_deletedKPIsDataSource numberOfItemsInSection:section];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_deletedKPIsDataSource didSelectRow:indexPath.row];
    [_tableView reloadData];
}

@end

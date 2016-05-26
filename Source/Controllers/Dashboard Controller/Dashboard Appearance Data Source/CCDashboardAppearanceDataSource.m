//
//  CCDashboardAppearanceDataSource.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCDashboardAppearanceDataSource.h"

#import "CCDashboardDataSourceProtocol.h"

#import "CCDashboardTableViewCell.h"
#import "CCDashboardViewModel.h"

@interface CCDashboardAppearanceDataSource ()

@property(nonatomic, weak) IBOutlet UITableView *tableView;

@property(nonatomic, strong) id<CCDashboardDataSourceProtocol> dataSource;

/**
 *  Contains NSNumber : NSMutableDictionary {NSNumber : ViewModel}
 */
@property(nonatomic, strong) NSMutableDictionary *viewModels;

@end

@implementation CCDashboardAppearanceDataSource

- (instancetype)init
{
    return [self initWithContentDataSource:nil];
}

- (instancetype)initWithContentDataSource:(id<CCDashboardDataSourceProtocol>)theDataSource
{
    self = [super init];
    
    if (self != nil)
    {
        _dataSource = theDataSource;
        _viewModels = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)reloadData
{
    __weak CCDashboardAppearanceDataSource *weakSelf = self;
    [[self dataSource] reloadContentWithSuccessBlock:^(BOOL success)
    {
        __strong CCDashboardAppearanceDataSource *strongSelf = weakSelf;
         
        dispatch_async(dispatch_get_main_queue(), ^
        {
            [strongSelf clearViewModels];
            
            for (int i = 0; i < [[self dataSource] countOfKPIItems]; i++)
            {
                [strongSelf viewModels][@(i)] = [strongSelf viewModelForItemIndex:i];
            }
            
            [[strongSelf tableView] reloadData];
        });
     }
                                        failureBlock:^(NSError *theError)
                                        {
                                            
                                        }];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self viewModels] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCDashboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCDashboardTableViewCell class])];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

#pragma mark - View Models

- (CCDashboardViewModel *)instantiateDefaultViewModelWithNameOfCompany:(NSString *)theNameOfCompany
                                                         typeOfCompany:(NSString *)theTypeOfCompany
                                                  phoneNumberOfCompany:(NSString *)thePhoneNumberOfCompany
                                                        emailOfCompany:(NSString *)theEmailOfCompany
{
    CCDashboardViewModel *vm = [[CCDashboardViewModel alloc] init];
    /*[vm setName:theNameOfCompany];
    [vm setType:theTypeOfCompany];
    [vm setPhoneNumber:thePhoneNumberOfCompany];
    [vm setEmail:theEmailOfCompany];*/
    
    CGFloat boundingWidth = CGRectGetWidth([[self tableView] frame]);
    [vm setCachedHeight:@([CCDashboardTableViewCell itemHeightWithViewModel:vm inWidth:boundingWidth])];
    
    return vm;
}

- (CCDashboardViewModel *)viewModelForItemIndex:(NSInteger)theItem
{
    CCDashboardViewModel *vm = [self viewModels][@(theItem)];
    
    if (vm == nil)
    {
        /*vm = [self instantiateDefaultViewModelWithNameOfCompany:[[self dataSource] getCompanyNameWithIndex:theItem]
                                                  typeOfCompany:[[self dataSource] getCompanyTypeWithIndex:theItem]
                                           phoneNumberOfCompany:[[self dataSource] getCompanyPhoneNumberWithIndex:theItem]
                                                 emailOfCompany:[[self dataSource] getCompanyEmailWithIndex:theItem]];*/
        
        [self setViewModel:vm forItemIndex:theItem];
    }
    
    return vm;
}

- (void)setViewModel:(CCDashboardViewModel *)theViewModel forItemIndex:(NSInteger)theItem
{
    [self viewModels][@(theItem)] = theViewModel;
}

- (void)clearViewModels
{
    @autoreleasepool
    {
        [self setViewModels:[NSMutableDictionary dictionary]];
    }
}

@end

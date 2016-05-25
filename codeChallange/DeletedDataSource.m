//
//  DeletedDataSource.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "DeletedDataSource.h"
#import "CoreDataManager.h"
#import "KPIEntity.h"

@interface DeletedDataSource()
{
    NSMutableArray <KPIEntity *> *_items;
}

@end

@implementation DeletedDataSource

-(instancetype)init
{
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
        [self updateItems];
    }
    
    return self;
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


-(void)updateItems
{
    [_items removeAllObjects];
    
    for (KPICDEntity *entity in [[CoreDataManager shared] kpiDeletedItems]) {
        [_items addObject:[[KPIEntity alloc] initWithKPICDEnity:entity]];
    }
    
}


//==============================================================================


-(void)didSelectRow:(NSUInteger)row
{
    _items[row].deleted = NO;
    [self updateItems];
}


//==============================================================================

@end


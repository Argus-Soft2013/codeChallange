//
//  DeletedDataSource.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>


@class KPIEntity;

@interface DeletedDataSource : NSObject

-(NSUInteger)numberOfItemsInSection:(NSUInteger)section;

-(KPIEntity *)itemForRow:(NSUInteger)row;

-(void)didSelectRow:(NSUInteger)row;


@end

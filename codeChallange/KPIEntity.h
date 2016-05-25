//
//  KPIEntity.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KPISurroundingPeriodData, KPIValue, KPICDEntity;

@interface KPIEntity : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) KPIValue *kpiValue;
@property (nonatomic, strong) KPISurroundingPeriodData *surroundingPeriodData;
@property (nonatomic, assign) BOOL deleted;

-(instancetype)initWithKPICDEnity:(KPICDEntity *)entity;

-(BOOL)isDeleted;

@end

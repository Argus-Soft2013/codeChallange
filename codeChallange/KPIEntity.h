//
//  KPIEntity.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KPISurroundingPeriodData, KPIValue;

@interface KPIEntity : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) KPIValue *kpiValue;
@property (nonatomic, strong) KPISurroundingPeriodData *surroundingPeriodData;


@end

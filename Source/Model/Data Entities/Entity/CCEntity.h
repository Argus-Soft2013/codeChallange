//
//  CCEntity.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCValue.h"
#import "CCSurroundingPeriodData.h"

@interface CCEntity : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *label;
@property (nonatomic, strong) CCValue *kpiValue;
@property (nonatomic, strong) CCSurroundingPeriodData *surroundingPeriodData;
@property (nonatomic, assign, getter=isDeleted) BOOL deleted;

- (BOOL)isEqualToEntity:(CCEntity *)theEntity;

@end

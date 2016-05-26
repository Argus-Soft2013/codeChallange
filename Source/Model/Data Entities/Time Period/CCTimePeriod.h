//
//  CCTimePeriod.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCTimePeriod : NSObject<NSCopying, NSCoding>

@property(nonatomic, copy) NSString *sliceUnit;
@property(nonatomic, strong) NSNumber *sliceUnitCount;
@property(nonatomic, strong) NSNumber *sliceCount;
@property(nonatomic, strong) NSDate *periodEnd;

- (BOOL)isEqualToTimePeriod:(CCTimePeriod *)theTimePeriod;

@end

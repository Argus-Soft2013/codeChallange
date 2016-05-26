//
//  CCFetchResult.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCFetchResult : NSObject<NSCopying, NSCoding>

@property(nonatomic, strong, readonly) NSArray *items;

- (instancetype)initWithItems:(NSArray *)theItems;

@end

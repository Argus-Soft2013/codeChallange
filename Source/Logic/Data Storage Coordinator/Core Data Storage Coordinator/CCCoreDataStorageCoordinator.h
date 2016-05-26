//
//  CCCoreDataStorageCoordinator.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCDataStorageCoordinator.h"

@class CCCoreDataObjectMapper;

@interface CCCoreDataStorageCoordinator : NSObject<CCDataStorageCoordinator>

- (instancetype)initWithDataMapper:(CCCoreDataObjectMapper *)theMapper NS_DESIGNATED_INITIALIZER;

@end

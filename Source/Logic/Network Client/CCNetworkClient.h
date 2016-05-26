//
//  CCNetworkClient.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCOperationDefines.h"

@class CCRequestAction, CCNetworkClientConfiguration;

typedef void (^CCNetworkClientSuccessBlock)(id responseObject);

@interface CCNetworkClient : NSObject

+ (instancetype)new __unavailable;
- (instancetype)init __unavailable;

- (instancetype)initWithConfiguration:(CCNetworkClientConfiguration *)theConfig;

- (NSURLSessionDataTask *)sendRequestWithAction:(CCRequestAction *)requestAction
                                   successBlock:(CCNetworkClientSuccessBlock)responseObjectBlock
                                     errorBlock:(CCOperationFailureBlock)errorBlock;

@end

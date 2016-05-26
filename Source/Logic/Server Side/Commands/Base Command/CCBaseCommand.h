//
//  CCBaseCommand.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCConnectionCommandProtocol.h"

@class CCNetworkClient;
@class CCRequestAction;

@interface CCBaseCommand : NSOperation<CCConnectionCommandProtocol>

@property(nonatomic, copy) CCCommandSuccessBlockType successBlock;
@property(nonatomic, copy) CCCommandFailureBlockType failureBlock;

+ (instancetype)new __unavailable;
- (instancetype)init __unavailable;

- (instancetype)initWithClient:(CCNetworkClient *)theClient
                  successBlock:(CCCommandSuccessBlockType)theSuccessBlock
                  failureBlock:(CCCommandFailureBlockType)theFailureBlock;

@end

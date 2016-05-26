//
//  CCServerSideManager.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCConnectionCommandProtocol.h"

@class CCNetworkClient;

@interface CCServerSideManager : NSObject

- (instancetype)initWithNetworkClient:(CCNetworkClient *)theClient;

#pragma mark -

- (void)getDashboardWithSuccessBlock:(CCCommandSuccessBlockType)theSuccessBlock
                        failureBlock:(CCCommandFailureBlockType)theFailureBlock;

@end

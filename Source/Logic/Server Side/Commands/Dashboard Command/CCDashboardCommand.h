//
//  CCDashboardCommand.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCBaseCommand.h"

@interface CCDashboardCommand : CCBaseCommand

- (instancetype)initWithClient:(CCNetworkClient *)theClient
                  successBlock:(CCCommandSuccessBlockType)theSuccessBlock
                  failureBlock:(CCCommandFailureBlockType)theFailureBlock;

@end

//
//  CCBaseCommand_Protected.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCBaseCommand.h"
#import "CCBaseCommand+Utility.h"

#import "CCRequestAction.h"

@interface CCBaseCommand ()

@property(nonatomic, strong, readonly) CCNetworkClient *networkClient;
@property(nonatomic, strong) CCRequestAction *requestAction;

- (CCRequestAction *)createActionForCommand;
- (void)performRequestWithAction:(CCRequestAction *)theAction;

/**
 *  @return YES - completed, NO - failed
 */
- (BOOL)parseResponseObject:(id)theResponse;

- (void)processSuccess;
- (void)processFailure;
- (void)processCancel;

@end

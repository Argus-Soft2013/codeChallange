//
//  CCServerSideManager.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCServerSideManager.h"

#import "CCNetworkClient.h"

#import "CCDashboardCommand.h"

@interface CCServerSideManager ()

@property(nonatomic, strong) CCNetworkClient *client;

@property(nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation CCServerSideManager

static NSUInteger const CCServersideMaxNumberOfConnections = 5;

- (instancetype)initWithNetworkClient:(CCNetworkClient *)theClient
{
    self = [super init];
    
    if (self)
    {
        _operationQueue = [self instantiateOperationQueue];
        
        _client = theClient;
    }
    
    return self;
}

#pragma mark Dashboard

- (void)getDashboardWithSuccessBlock:(CCCommandSuccessBlockType)theSuccessBlock
                        failureBlock:(CCCommandFailureBlockType)theFailureBlock
{
    [self enqueueCommand:[[CCDashboardCommand alloc] initWithClient:[self client]
                                                       successBlock:theSuccessBlock
                                                       failureBlock:theFailureBlock]];
}

#pragma mark - Private

- (void)enqueueCommand:(CCBaseCommand *)theCommand
{
    [[self operationQueue] addOperation:theCommand];
}

#pragma mark Configuration

- (NSOperationQueue *)instantiateOperationQueue
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue setMaxConcurrentOperationCount:CCServersideMaxNumberOfConnections];
    
    return queue;
}

@end

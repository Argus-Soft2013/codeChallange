//
//  CCBaseCommand.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCBaseCommand.h"
#import "CCBaseCommand_Protected.h"

#import "CCNetworkClient.h"

@interface CCBaseCommand ()

@property(nonatomic, assign, getter = isCommandInProgress) BOOL commandInProgress;

@end

@implementation CCBaseCommand

@synthesize results, statusCode, connectionError;

#pragma mark - Memory management

- (instancetype)initWithClient:(CCNetworkClient *)theClient
                  successBlock:(CCCommandSuccessBlockType)theSuccessBlock
                  failureBlock:(CCCommandFailureBlockType)theFailureBlock
{
    self = [super init];
    
    if (self)
    {
        _networkClient = theClient;
        
        _successBlock = [theSuccessBlock copy];
        _failureBlock = [theFailureBlock copy];
    }
    
    return self;
}

#pragma mark - Operation

- (void)start
{
    if ([self isCancelled])
    {
        [self processCancel];
        return;
    }
    
    CCRequestAction *action = [self createActionForCommand];
    [self setRequestAction:action];
    
    [self performRequestWithAction:action];
}

- (BOOL)isExecuting
{
    return [self isCommandInProgress];
}

- (BOOL)isFinished
{
    return ![self isCommandInProgress];
}

- (BOOL)isConcurrent
{
    return YES;
}

- (BOOL)isAsynchronous
{
    return YES;
}

#pragma mark - Protected

- (CCRequestAction *)createActionForCommand
{
    NSLog(@"'%@' should implement action", NSStringFromClass([self class]));
    ASSERT(0, @"Action not implemented");
    
    return nil;
}

- (void)performRequestWithAction:(CCRequestAction *)theAction
{
    [self setCommandInProgress:YES];
    
    __weak CCBaseCommand *weakSelf = self;
    [[self networkClient] sendRequestWithAction:theAction
                                   successBlock:^(id responseObject)
     {
         __strong CCBaseCommand *strongSelf = weakSelf;
         BOOL isSuccess = [strongSelf parseResponseObject:responseObject];
         
         if (!isSuccess)
         {
             NSError * parseError = nil;
             [strongSelf setConnectionError:parseError];
             [strongSelf processFailure];
             
             [strongSelf setCommandInProgress:NO];
             
             return;
         }
         
         [strongSelf processSuccess];
         
         [strongSelf setCommandInProgress:NO];
     }
                                     errorBlock:^(NSError *theError)
     {
         __strong CCBaseCommand *strongSelf = weakSelf;
         [strongSelf setConnectionError:theError];
         [strongSelf processFailure];
         
         [strongSelf setCommandInProgress:NO];
     }];
}

- (BOOL)parseResponseObject:(id)theResponse
{
    NSLog(@"'%@' should implement parse logic", NSStringFromClass([self class]));
    ASSERT(0, @"Parse logic not implemented");
    
    return NO;
}

- (void)processCancel
{
    NSError *cancelError = nil;
    [self setConnectionError:cancelError];
    
    [self processFailure];
}

- (void)processSuccess
{
    if ([self successBlock] != NULL)
    {
        __weak CCBaseCommand *weakSelf = self;
        [self successBlock](weakSelf);
    }
}

- (void)processFailure
{
    if ([self failureBlock] != NULL)
    {
        __weak CCBaseCommand *weakSelf = self;
        [self failureBlock](weakSelf);
    }
}

#pragma mark - Setter

- (void)setCommandInProgress:(BOOL)theCommandInProgress
{
    [self willChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
    [self willChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
    
    _commandInProgress = theCommandInProgress;
    
    [self didChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
    [self didChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
}

@end

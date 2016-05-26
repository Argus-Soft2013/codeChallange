//
//  CCNetworkClient.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCNetworkClient.h"

#import "AFHTTPSessionManager.h"
#import "CCHash.h"
#import "CCNetworkClientConfiguration.h"

#import "CCRequestAction.h"

@interface CCNetworkClient ()

@property(nonatomic, copy) CCNetworkClientConfiguration *currentConfiguration;
@property(nonatomic, strong) AFHTTPSessionManager *sessionManager;

@property(nonatomic, strong) NSString *token;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *password;

@end

@implementation CCNetworkClient

#pragma mark - Memory management

- (instancetype)initWithConfiguration:(CCNetworkClientConfiguration *)theConfig
{
    self = [super init];
    
    if (self != nil)
    {
        _currentConfiguration = [theConfig copy];
        
        NSURL *baseURL = [NSURL URLWithString:[theConfig baseURLString]];
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
        [self setSessionManager:manager];
        
        [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        
        [[manager requestSerializer] setValue:[theConfig mobileHeaderValue]
                           forHTTPHeaderField:[theConfig mobileHeaderName]];
        
        [[manager requestSerializer] setValue:[theConfig basicAuthValue]
                           forHTTPHeaderField:[theConfig authHeaderName]];
        
        [manager setCompletionQueue:dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)];
    }
    
    return self;
}

#pragma mark - CCSessionInfo

- (void)setSessionToken:(NSString *)sessionToken
{
    [self setToken:[sessionToken copy]];
}

- (void)setUserEmail:(NSString *)email
{
    [self setEmail:email];
}

- (void)setUserPassword:(NSString *)password
{
    [self setPassword:password];
}

- (void)clearSessionInfo
{
    [self setToken:nil];
    [self setEmail:nil];
    [self setPassword:nil];
}

#pragma mark - Public

- (NSURLSessionDataTask *)sendRequestWithAction:(CCRequestAction *)requestAction
                                   successBlock:(CCNetworkClientSuccessBlock)responseObjectBlock
                                     errorBlock:(CCOperationFailureBlock)errorBlock
{
    [requestAction setRequestParameters:[self getEmailAndPasswordForSessionWithCheckingDictionary:[requestAction requestParameters]]];
    
    switch ([requestAction requestMethod])
    {
        case CCRequestMethodGet:
        {
            return [[self sessionManager] GET:[requestAction requestAction]
                                   parameters:[self addGeneralParamsWithRequestAction:requestAction]
                                     progress:^(NSProgress * _Nonnull downloadProgress)
                                        {
                                         
                                        }
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
                                        {
                                            responseObjectBlock(responseObject);
                                        }
                                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
                                        {
                                            errorBlock(error);
                                        }];
            
            break;
        }
        case CCRequestMethodPost:
        {
            return [[self sessionManager] POST:[requestAction requestAction]
                                    parameters:[self addGeneralParamsWithRequestAction:requestAction]
                                      progress:^(NSProgress * _Nonnull downloadProgress)
                                        {
                        
                                        }
                                       success:^(NSURLSessionDataTask *task, id responseObject)
                                        {
                                            responseObjectBlock(responseObject);
                                        }
                                       failure:^(NSURLSessionDataTask *task, NSError *error)
                                        {
                                            errorBlock(error);
                                        }];
            
            break;
        }
        case CCRequestMethodPut:
        {
            return [[self sessionManager] PUT:[requestAction requestAction]
                                   parameters:[self addGeneralParamsWithRequestAction:requestAction]
                                      success:^(NSURLSessionDataTask *task, id responseObject)
                                        {
                                            responseObjectBlock(responseObject);
                                        }
                                      failure:^(NSURLSessionDataTask *task, NSError *error)
                                        {
                                            errorBlock(error);
                                        }];
            
            break;
        }
        case CCRequestMethodDelete:
        {
            return [[self sessionManager] DELETE:[requestAction requestAction]
                                      parameters:[self addGeneralParamsWithRequestAction:requestAction]
                                         success:^(NSURLSessionDataTask *task, id responseObject)
                                            {
                                                responseObjectBlock(responseObject);
                                            }
                                         failure:^(NSURLSessionDataTask *task, NSError *error)
                                            {
                                                errorBlock(error);
                                            }];
            
            break;
        }
        default:
            break;
    }
}

#pragma mark - Private

- (NSMutableDictionary *)addGeneralParamsWithRequestAction:(CCRequestAction *)requestAction
{
    NSMutableDictionary *params = [[requestAction requestParameters] mutableCopy];
    
    if ([[requestAction requestAction] containsString:[[self currentConfiguration] apiURLPrefix]])
    {
        if ([self token] != nil)
        {
            params[@"bearer"] = [self token];
        }
    }
    
    params[@"_format"] = @"json";
    
    return params;
}

- (NSDictionary *)getEmailAndPasswordForSessionWithCheckingDictionary:(NSDictionary *)param
{
    if ([self containsKey:@"email" withDictionary:param])
    {
        if ([[param objectForKey:@"email"] isEqualToString:@""])
        {
            NSMutableDictionary *params = [param mutableCopy];
            params[@"email"] = [self email];
            param = params;
        }
    }
    
    if ([self containsKey:@"password" withDictionary:param])
    {
        if ([[param objectForKey:@"password"] isEqualToString:@""])
        {
            NSString *hashPassword = [CCHash hashForLoginWithString:[self password]];
            
            NSMutableDictionary *params = [param mutableCopy];
            params[@"password"] = hashPassword;
            param = params;
        }
    }
    
    return param;
}

- (BOOL)containsKey:(NSString *)key withDictionary:(NSDictionary *)dic
{
    BOOL retVal = NO;
    NSArray *allKeys = [dic allKeys];
    retVal = [allKeys containsObject:key];
    
    return retVal;
}

@end

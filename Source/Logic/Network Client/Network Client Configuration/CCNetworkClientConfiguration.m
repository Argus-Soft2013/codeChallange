//
//  CCNetworkClientConfiguration.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCNetworkClientConfiguration.h"

static NSString *const CCNetworkClientURLPrefix = @"";

static NSString *const CCNetworkClientAuthorizationHeaderName = @"Authorization";
static NSString *const CCNetworkClientMobileHeaderName = @"is_mobile";
static NSString *const CCNetworkClientMobileHeaderValue = @"true";

static NSString *const CCNetworkClientBaseURL = @"https://opx.cfapps.io/";

@interface CCNetworkClientConfiguration ()

@property(nonatomic, copy, readwrite) NSString *baseURLString;
@property(nonatomic, copy, readwrite) NSString *apiURLPrefix;

@property(nonatomic, copy, readwrite) NSString *basicAuthValue;
@property(nonatomic, copy, readwrite) NSString *authHeaderName;

@property(nonatomic, copy, readwrite) NSString *mobileHeaderName;
@property(nonatomic, copy, readwrite) NSString *mobileHeaderValue;

@end

@implementation CCNetworkClientConfiguration

#pragma mark - Memory management

+ (instancetype)defaultConfigurationWithClientURLString:(NSString *)theURLString
                                         basicAuthValue:(NSString *)theAuthValue
{
    CCNetworkClientConfiguration *config = [[[self class] alloc] init];
    [config setBaseURLString:theURLString];
    [config setApiURLPrefix:CCNetworkClientURLPrefix];
    [config setBasicAuthValue:theAuthValue];
    [config setAuthHeaderName:CCNetworkClientAuthorizationHeaderName];
    [config setMobileHeaderName:CCNetworkClientMobileHeaderName];
    [config setMobileHeaderValue:CCNetworkClientMobileHeaderValue];
    
    return config;
}

#pragma mark - Public

+ (instancetype)currentConfiguration
{
    return [self developmentConfiguration];
}

+ (instancetype)developmentConfiguration
{
    return [self defaultConfigurationWithClientURLString:CCNetworkClientBaseURL
                                          basicAuthValue:/*CCNetworkClientDevBasicAuth*/nil];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    CCNetworkClientConfiguration *copy = [[[self class] alloc] init];
    
    if (copy != nil)
    {
        [copy setBaseURLString:_baseURLString];
        [copy setApiURLPrefix:_apiURLPrefix];
        [copy setAuthHeaderName:_authHeaderName];
        [copy setBasicAuthValue:_basicAuthValue];
        [copy setMobileHeaderName:_mobileHeaderName];
        [copy setMobileHeaderValue:_mobileHeaderValue];
    }
    
    return copy;
}

@end

//
//  CCNetworkClientConfiguration.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCNetworkClientConfiguration : NSObject<NSCopying>

@property(nonatomic, copy, readonly) NSString *baseURLString;
@property(nonatomic, copy, readonly) NSString *apiURLPrefix;

@property(nonatomic, copy, readonly) NSString *authHeaderName;
@property(nonatomic, copy, readonly) NSString *basicAuthValue;

@property(nonatomic, copy, readonly) NSString *mobileHeaderName;
@property(nonatomic, copy, readonly) NSString *mobileHeaderValue;

+ (instancetype)currentConfiguration;

+ (instancetype)developmentConfiguration;

@end

//
//  CCRequestAction.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CCRequestMethod)
{
    CCRequestMethodGet = 0,
    CCRequestMethodPost,
    CCRequestMethodPut,
    CCRequestMethodDelete
};

@interface CCRequestAction : NSObject

@property(nonatomic, assign) CCRequestMethod requestMethod;
@property(nonatomic, copy) NSString *requestAction;
@property(nonatomic, copy) NSDictionary *requestParameters;

@end

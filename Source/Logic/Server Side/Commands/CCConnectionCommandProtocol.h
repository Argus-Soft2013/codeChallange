//
//  CCConnectionCommandProtocol.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

@protocol CCConnectionCommandProtocol;

typedef void (^CCCommandSuccessBlockType)(id<CCConnectionCommandProtocol> command);
typedef void (^CCCommandFailureBlockType)(id<CCConnectionCommandProtocol> command);

@protocol CCConnectionCommandProtocol<NSObject>

/**
 *  Contains {Model class name : |object/Collection of objects|}
 */
@property(nonatomic, copy) NSDictionary *results;

/**
 *  HTTP status code
 */
@property(nonatomic, assign) NSInteger statusCode;
@property(nonatomic, strong) NSError *connectionError;

@end

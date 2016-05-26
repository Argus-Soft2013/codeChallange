//
//  CCDashboardCommand.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCDashboardCommand.h"

#import "CCBaseCommand_Protected.h"

#import "CCNetworkClient.h"

static NSString *const CCGetDashboardAction = @"dashboarditems";

@implementation CCDashboardCommand

- (instancetype)initWithClient:(CCNetworkClient *)theClient
                  successBlock:(CCCommandSuccessBlockType)theSuccessBlock
                  failureBlock:(CCCommandFailureBlockType)theFailureBlock
{
    self = [super initWithClient:theClient successBlock:theSuccessBlock failureBlock:theFailureBlock];
    
    if (self)
    {
        
    }
    
    return self;
}

#pragma mark - Protected

- (CCRequestAction *)createActionForCommand
{
    CCRequestAction *action = [[CCRequestAction alloc] init];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [action setRequestAction:CCGetDashboardAction];
    [action setRequestMethod:CCRequestMethodGet];
    [action setRequestParameters:parameters];
    
    return action;
}

- (BOOL)parseResponseObject:(id)theResponse
{
    NSArray *products = CC_VALID_FROM_JSON(theResponse[@"products"]);
    
    [self setResults:@{
                          // NSStringFromClass([CCProduct class]) : [self parsedProductsFromArray:products]
                      }];
    
    return YES;
}

#pragma mark - Private
/*
- (NSArray *)parsedProductsFromArray:(NSArray *)products
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSDictionary *prod in products)
    {
        CCProduct *product = [[CCProduct alloc] init];
        
        [product setProductID:CC_VALID_FROM_JSON([prod objectForKey:@"id"]) ? [[prod objectForKey:@"id"] integerValue] : 0];
        [product setProductName:CC_VALID_FROM_JSON([prod objectForKey:@"name"])];
        [product setProductDescription:CC_VALID_FROM_JSON([prod objectForKey:@"description"])];
        [product setProductCategory:CC_VALID_FROM_JSON([prod objectForKey:@"type"])];
        [product setProductImage:[CCImage imageWithURLString:CC_VALID_FROM_JSON(prod[@"image_url"]) image:nil]];
        [product setTags:CC_VALID_FROM_JSON(@[[prod objectForKey:@"tags"]])];
        [product setBrandName:CC_VALID_FROM_JSON([prod objectForKey:@"brand"])];
        [product setProductQuantity:CC_VALID_FROM_JSON([prod objectForKey:@"quantity"]) ? [[prod objectForKey:@"quantity"] integerValue] : 0];
        [product setProductStatus:[self activityStatusFromString:CC_VALID_FROM_JSON([prod objectForKey:@"status"])]];
        [product setSupplierName:CC_VALID_FROM_JSON([prod objectForKey:@"supplier"])];
        [product setVendorName:CC_VALID_FROM_JSON([prod objectForKey:@"vendor"])];
        
        [product setProductVariants:[self createVariantsEntityWithIdsArray:CC_VALID_FROM_JSON([prod objectForKey:@"variants"])]];
        
        [product setCreationDate:CC_VALID_FROM_JSON([prod objectForKey:@"created_at"]) ? [[self dateConverter] dateWithMillisecondString:prod[@"created_at"]] : nil];
        [product setModificationDate:CC_VALID_FROM_JSON([prod objectForKey:@"updated_at"]) ? [[self dateConverter] dateWithMillisecondString:prod[@"updated_at"]] : nil];
        
        [result addObject:product];
    }
    
    return result;
}*/

@end

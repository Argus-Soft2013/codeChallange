//
//  CCReusableItemMetaInfoProtocol.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCReusableItemMetaInfoProtocol<NSObject>

@required

+ (NSString *)itemReuseIdentifier;
+ (NSString *)itemNibName;

@end

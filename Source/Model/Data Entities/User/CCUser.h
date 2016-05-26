//
//  CCUser.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CCEntity.h"

@interface CCUser : NSObject<NSCopying, NSCoding>

@property(nonatomic, copy) NSString *login;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, strong) CCEntity *entity;

- (BOOL)isEqualToUser:(CCUser *)theUser;

@end

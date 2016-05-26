//
//  CCUser.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCUser.h"
#import "NSMutableDictionary+CCUtility.h"

@implementation CCUser

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)theZone
{
    CCUser *copy = [[[self class] alloc] init];
    
    if (copy)
    {
        [copy setLogin:_login];
        [copy setPassword:_password];
        [copy setEntity:[_entity copy]];
    }
    
    return copy;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)theDecoder
{
    self = [super init];
    
    if (self)
    {
        NSDictionary *rootDict = [theDecoder decodeObjectForKey:NSStringFromClass([CCUser class])];
        
        [self setLogin:rootDict[NSStringFromSelector(@selector(login))]];
        [self setPassword:rootDict[NSStringFromSelector(@selector(password))]];
        [self setEntity:rootDict[NSStringFromSelector(@selector(entity))]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)theCoder
{
    NSMutableDictionary *rootDict = [NSMutableDictionary dictionary];
    
    [rootDict cc_setNotNilObject:[self login] forKey:NSStringFromSelector(@selector(login))];
    [rootDict cc_setNotNilObject:[self password] forKey:NSStringFromSelector(@selector(password))];
    [rootDict cc_setNotNilObject:[self entity] forKey:NSStringFromSelector(@selector(entity))];
    
    [theCoder encodeObject:rootDict forKey:NSStringFromClass([CCUser class])];
}

#pragma mark - Compare

- (BOOL)isEqual:(id)theObject
{
    if (theObject == self)
    {
        return YES;
    }
    
    if (!theObject || !([theObject isKindOfClass:[self class]]) )
    {
        return NO;
    }
    
    return [self isEqualToUser:theObject];
}

- (BOOL)isEqualToUser:(CCUser *)theUser
{
    if (([theUser login] != _login) &&
        ![[theUser login] isEqualToString:_login])
    {
        return NO;
    }
    
    if (([theUser password] != _password) &&
        ![[theUser password] isEqualToString:_password])
    {
        return NO;
    }
    
    if (([theUser entity] != _entity) &&
        ![[theUser entity] isEqualToEntity:_entity])
    {
        return NO;
    }
    
    return YES;
}

- (NSUInteger)hash
{
    return [_login hash] ^ [_password hash] ^ [_entity hash];
}

@end

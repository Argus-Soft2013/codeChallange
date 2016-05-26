//
//  NSMutableDictionary+CCUtility.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (CCUtility)

- (void)cc_setNotNilObject:(id)theObject forKey:(id<NSCopying>)theKey;

@end

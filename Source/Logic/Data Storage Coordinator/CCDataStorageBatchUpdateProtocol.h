//
//  CCDataStorageBatchUpdateProtocol.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

@class CCUser;

typedef void (^CCDataStorageProgressBlock)(NSInteger itemID, BOOL isSuccess);

@protocol CCDataStorageBatchUpdateProtocol<NSObject>

#pragma mark -

- (void)saveBatchedChanges;

#pragma mark - User

- (BOOL)performBatchedInsertOfAccounts:(NSArray<CCUser *> *)theUser
                     withProgressBlock:(CCDataStorageProgressBlock)theProgressBlock
                                 error:(NSError **)theError;

@end

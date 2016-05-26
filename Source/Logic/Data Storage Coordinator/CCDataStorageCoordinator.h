//
//  CCDataStorageCoordinator.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCDataStorageBatchUpdateProtocol.h"

@protocol CCDataStorageCoordinator <NSObject>

- (BOOL)purgeStorageContentWithError:(NSError **)theError;

@end

//
//  FMDBStoreGenerator
//
//  Copyright (c) 2012 Kouji Ishii
//
//  This software is released under the MIT License.
//
//  http://opensource.org/licenses/mit-license.php
//

#import "KOTransactionService.h"
#import "KODatabaseManager.h"

@implementation KOTransactionService

- (id) init {
    self = [super init];
    
    if (self) {
        _queue = [[KODatabaseManager sharedManager] databaseQueue];        
    }
    
    return self;
}

- (void)dealloc {
	if (_queue) {
		[_queue close];
	}
}

@end

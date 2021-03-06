//
//  FMDBStoreGenerator
//
//  Copyright (c) 2012 Kouji Ishii
//
//  This software is released under the MIT License.
//
//  http://opensource.org/licenses/mit-license.php
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"

/**
 * This class provides FMDatabaseQueue, which is initialized with sqlite file of bundle resource.
 */
@interface KODatabaseManager : NSObject

@property(readonly,strong)FMDatabaseQueue *databaseQueue;

/**
 * gets singlton object.
 * @return singlton
 */
+ (KODatabaseManager*)sharedManager;

@end

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

/**
 * this class become base class for Transaction boundary, which use [FMDatabaseQueue inTransaction:]
 */
@interface KOTransactionService : NSObject{

@protected
    FMDatabaseQueue *_queue;
}



@end

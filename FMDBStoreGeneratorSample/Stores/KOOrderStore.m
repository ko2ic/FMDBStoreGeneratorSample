//
//  FMDBStoreGenerator
//
//  Copyright (c) 2012 Kouji Ishii
//
//  This software is released under the MIT License.
//
//  http://opensource.org/licenses/mit-license.php
//

#import "KOOrderStore.h"
#import "KOOrder.h"

@implementation KOOrderStore

#pragma mark - auto-generated

static NSString* const ORDER_ID = @"order_id";
static NSString* const DELETE_FLAG = @"delete_flag";

- (NSString *) tableName{
    return @"t_order";
}

- (NSArray *) columnNames {
    return [[self primaryKeyColumnNames] arrayByAddingObjectsFromArray:[self notPrimaryKeyColumnNames]];
}

- (NSArray*) primaryKeyColumnNames
{
    return @[ORDER_ID,
        ];
}

- (NSArray*) notPrimaryKeyColumnNames
{
    return @[DELETE_FLAG,
        ];
}

- (NSArray *) primaryKeyInfo:(id) entity
{
   KOOrder *castEntity = (KOOrder*)entity;
    return
    @[
      @{@"name":ORDER_ID,
        @"value":@(castEntity.orderId)
        },
      ];
}


- (NSArray *) notPrimaryKeyInfo:(id) entity
{
    KOOrder *castEntity = (KOOrder*)entity;
    return
    @[
      @{@"name":DELETE_FLAG,
        @"value":[NSNumber numberWithBool:castEntity.deleteFlag] ?:[NSNumber numberWithBool:NO] 
        },
        
      ];

}

- (ConverterToEntityBlock ) converterToEntityBlock {
    ConverterToEntityBlock block = ^id(FMResultSet *rs) {
        
        KOOrder *entity = [[KOOrder alloc] init];

        entity.orderId = [rs intForColumn:ORDER_ID];
        entity.deleteFlag = [rs boolForColumn:DELETE_FLAG];
        return entity;
    };
    
    return block;
}

@end
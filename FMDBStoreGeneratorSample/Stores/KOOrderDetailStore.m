//
//  FMDBStoreGenerator
//
//  Copyright (c) 2012 Kouji Ishii
//
//  This software is released under the MIT License.
//
//  http://opensource.org/licenses/mit-license.php
//

#import "KOOrderDetailStore.h"
#import "KOOrderDetail.h"

@implementation KOOrderDetailStore

#pragma mark - auto-generated

static NSString* const ORDER_ID = @"order_id";
static NSString* const ORDER_DETAIL_ID = @"order_detail_id";
static NSString* const NAME = @"name";
static NSString* const PRICE = @"price";
static NSString* const QUANTITY = @"quantity";
static NSString* const DELETE_FLAG = @"delete_flag";
static NSString* const UPDATE_DATETIME = @"update_datetime";

- (NSString *) tableName{
    return @"t_order_detail";
}

- (NSArray *) columnNames {
    return [[self primaryKeyColumnNames] arrayByAddingObjectsFromArray:[self notPrimaryKeyColumnNames]];
}

- (NSArray*) primaryKeyColumnNames
{
    return @[ORDER_ID,
        ORDER_DETAIL_ID,
        ];
}

- (NSArray*) notPrimaryKeyColumnNames
{
    return @[NAME,
        PRICE,
        QUANTITY,
        DELETE_FLAG,
        UPDATE_DATETIME,
        ];
}

- (NSArray *) primaryKeyInfo:(id) entity
{
   KOOrderDetail *castEntity = (KOOrderDetail*)entity;
    return
    @[
      @{@"name":ORDER_ID,
        @"value":@(castEntity.orderId)
        },
      @{@"name":ORDER_DETAIL_ID,
        @"value":@(castEntity.orderDetailId)
        },
      ];
}


- (NSArray *) notPrimaryKeyInfo:(id) entity
{
    KOOrderDetail *castEntity = (KOOrderDetail*)entity;
    return
    @[
      @{@"name":NAME,
        @"value":castEntity.name 
        },
        @{@"name":PRICE,
        @"value":castEntity.price ?:[NSNull null]
        },
        @{@"name":QUANTITY,
        @"value":castEntity.quantity ?:[NSNull null]
        },
        @{@"name":DELETE_FLAG,
        @"value":[NSNumber numberWithBool:castEntity.deleteFlag] ?:[NSNumber numberWithBool:NO] 
        },
        @{@"name":UPDATE_DATETIME,
        @"value":castEntity.updateDatetime ?:[NSNull null]
        },
        
      ];

}

- (ConverterToEntityBlock ) converterToEntityBlock {
    ConverterToEntityBlock block = ^id(FMResultSet *rs) {
        
        KOOrderDetail *entity = [[KOOrderDetail alloc] init];

        entity.orderId = [rs intForColumn:ORDER_ID];
        entity.orderDetailId = [rs intForColumn:ORDER_DETAIL_ID];
        entity.name = [rs stringForColumn:NAME];
        entity.price = [rs columnIsNull:PRICE] ? nil : [rs objectForColumnName:PRICE];
        entity.quantity = [rs columnIsNull:QUANTITY] ? nil : [rs objectForColumnName:QUANTITY];
        entity.deleteFlag = [rs boolForColumn:DELETE_FLAG];
        entity.updateDatetime = [rs dateForColumn:UPDATE_DATETIME];
        return entity;
    };
    
    return block;
}

@end
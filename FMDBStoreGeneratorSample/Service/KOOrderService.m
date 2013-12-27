//
//  KOOrderService.m
//  FMDBStoreGeneratorSample
//
//  Created by 石井 幸次 on 2013/10/31.
//  Copyright (c) 2013年 Kouji Ishii. All rights reserved.
//

#import "KOOrderService.h"
#import "KOOrderStore.h"
#import "KOOrderDetailStore.h"

@implementation KOOrderService

- (KOOrderDetail*) findDetailByPk:(KOOrderDetail*) detail{
    __block KOOrderDetail *entity = nil;
    [_queue inDatabase:^(FMDatabase *db) {
        KOOrderDetailStore *detailStore = [[KOOrderDetailStore alloc]initWithFMDatabase:db];
        entity = [detailStore findByPk:detail];
    }];
    return entity;
}

- (NSArray*) findAll{
    __block NSArray* array;
    [_queue inDatabase:^(FMDatabase *db) {
        KOOrderStore *store = [[KOOrderStore alloc]initWithFMDatabase:db];
        array = [store findAll];
    }];
    return array;
}

- (void) storeDetail:(KOOrderDetail*)form {
    
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        @try {
            KOOrderDetailStore *detailStore = [[KOOrderDetailStore alloc]initWithFMDatabase:db];
            KOOrderStore *orderStore = [[KOOrderStore alloc]initWithFMDatabase:db];
            if([detailStore findByPk:form] == nil){
                KOOrder* order = [KOOrder new];
                order.deleteFlag = form.deleteFlag;
                
                [orderStore insertWithAutoIncrementPk:order];
                [detailStore insert:form];
            }else{
                [detailStore update:form];
            }
        }
        @catch (NSException *exception) {
            *rollback = YES;
            NSLog(@"%@",exception);
        }
    }];
}

- (void) removeDetail:(KOOrderDetail*)form;{
    
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        @try {
            KOOrderDetailStore *store = [[KOOrderDetailStore alloc]initWithFMDatabase:db];
            [store deleteByPk:form];
        }
        @catch (NSException *exception) {
            *rollback = YES;
            NSLog(@"%@",exception);            
        }
    }];
}

@end

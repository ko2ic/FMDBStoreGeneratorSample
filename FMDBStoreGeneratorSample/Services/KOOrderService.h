//
//  KOOrderService.h
//  FMDBStoreGeneratorSample
//
//  Created by 石井 幸次 on 2013/10/31.
//  Copyright (c) 2013年 Kouji Ishii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KOTransactionService.h"
#import "KOOrder.h"
#import "KOOrderDetail.h"

@interface KOOrderService : KOTransactionService

- (KOOrderDetail*) findDetailByPk:(KOOrderDetail*) detail;
- (NSArray*) findAll;
- (void) storeDetail:(KOOrderDetail*)form;
- (void) removeDetail:(KOOrderDetail*)form;

@end

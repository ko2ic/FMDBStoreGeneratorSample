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

@interface KOOrderDetail : NSObject

@property(nonatomic) NSInteger orderId;
@property(nonatomic) NSInteger orderDetailId;
@property(strong,nonatomic) NSString* name;
@property(strong,nonatomic) NSNumber* price;
@property(strong,nonatomic) NSNumber* quantity;
@property(nonatomic) BOOL deleteFlag;
@property(strong,nonatomic) NSDate* updateDatetime;

@end

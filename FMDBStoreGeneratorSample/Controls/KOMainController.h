//
//  KOMainController.h
//  FMDBStoreGeneratorSample
//
//  Created by 石井 幸次 on 2013/11/05.
//  Copyright (c) 2013年 Kouji Ishii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KOMainController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *price;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *quantity;
@property (weak, nonatomic) IBOutlet UITextField *orderId;
@property (weak, nonatomic) IBOutlet UITextField *detailId;
@property (weak, nonatomic) IBOutlet UIButton *hideKeyboardButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *deleteFlag;

@end

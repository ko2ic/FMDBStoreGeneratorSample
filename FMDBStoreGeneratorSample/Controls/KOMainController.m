//
//  KOMainController.m
//  FMDBStoreGeneratorSample
//
//  Created by 石井 幸次 on 2013/11/05.
//  Copyright (c) 2013年 Kouji Ishii. All rights reserved.
//

#import "KOMainController.h"
#import "KOOrderService.h"

@implementation KOMainController{
    @private BOOL deleteFlag_;
    @private __weak UITextField *activeField_;
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.scrollView.contentSize = CGSizeMake(320, 800);

    self.orderId.delegate = self;
    self.detailId.delegate = self;
    self.price.delegate = self;
    self.name.delegate = self;
    self.quantity.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void)keyboardWasShown:(NSNotification*)notification
{
    _hideKeyboardButton.enabled = YES;
    
    if(activeField_ == self.price){
        CGPoint scrollPoint = CGPointMake(0.0,50.0);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }else if(activeField_ == self.name){
        CGPoint scrollPoint = CGPointMake(0.0,100.0);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }else if(activeField_ == self.quantity){
        CGPoint scrollPoint = CGPointMake(0.0,150.0);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    _hideKeyboardButton.enabled = NO;
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    activeField_ = textField;
}

#pragma mark - Action

- (IBAction)findAll:(id)sender {
    KOOrderService* service = [KOOrderService new];
    NSArray* orders = [service findAll];
    for (KOOrder* order in orders) {
        NSLog(@"orderId:%d deleteFlag:%d",order.orderId, order.deleteFlag);
    }
}

- (IBAction)findDetailByPk:(id)sender {
    KOOrderService* service = [KOOrderService new];
    
    KOOrderDetail* detail = [KOOrderDetail new];
    detail.orderId = self.orderId.text.integerValue;
    detail.orderDetailId = self.detailId.text.integerValue;
    detail = [service findDetailByPk:detail];
    NSLog(@"orderId:%d orderDetailId:%d name:%@ price:%@ quantity:%@ deleteFlag:%d updateDatetime:%@",
          detail.orderId,
          detail.orderDetailId,
          detail.name,
          detail.price,
          detail.quantity,
          detail.deleteFlag,
          detail.updateDatetime);
    self.detailId.text = [NSString stringWithFormat : @"%d", detail.orderDetailId];
    self.name.text = detail.name;
    self.price.text = detail.price.stringValue;
    self.quantity.text = detail.quantity.stringValue;
    deleteFlag_ = detail.deleteFlag;
    if (deleteFlag_) {
        self.deleteFlag.selectedSegmentIndex = 0;
    }else{
        self.deleteFlag.selectedSegmentIndex = 1;
    }
}

- (IBAction)storeDetail:(id)sender {
    KOOrderService* service = [KOOrderService new];
    
    KOOrderDetail* detail = [KOOrderDetail new];
    detail.orderId = self.orderId.text.integerValue;
    detail.orderDetailId = self.detailId.text.integerValue;
    detail.price = @(self.price.text.doubleValue);
    detail.name = self.name.text;
    detail.quantity = @(self.quantity.text.integerValue);
    detail.deleteFlag = (self.deleteFlag.selectedSegmentIndex == 0);
    deleteFlag_ = detail.deleteFlag;
    detail.updateDatetime = [NSDate date];
    
    [service storeDetail:detail];
}

- (IBAction)removeDetail:(id)sender {
    KOOrderService* service = [KOOrderService new];
    
    KOOrderDetail* detail = [KOOrderDetail new];
    detail.orderId = self.orderId.text.integerValue;
    detail.orderDetailId = self.detailId.text.integerValue;
    
    [service removeDetail:detail];
    
}

- (IBAction)changeDeleteFlag:(UISegmentedControl*)sender {
    if(sender.selectedSegmentIndex == 0){
        deleteFlag_ = YES;
    }else{
        deleteFlag_ = NO;
    }
}

- (IBAction)hiddenKeyboard:(id)sender {
    [self.detailId endEditing:YES];
    [self.price endEditing:YES];
    [self.name endEditing:YES];
    [self.quantity endEditing:YES];
    [self.orderId endEditing:YES];
    self.hideKeyboardButton.enabled = NO;    
}
@end

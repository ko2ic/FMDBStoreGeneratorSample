//
//  KODetailViewController.m
//  FMDBStoreGeneratorSample
//
//  Created by 石井 幸次 on 2013/11/01.
//  Copyright (c) 2013年 Kouji Ishii. All rights reserved.
//

#import "KODetailViewController.h"

@interface KODetailViewController ()
- (void)configureView;
@end

@implementation KODetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

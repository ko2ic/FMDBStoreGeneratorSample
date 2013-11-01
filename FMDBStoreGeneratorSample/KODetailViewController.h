//
//  KODetailViewController.h
//  FMDBStoreGeneratorSample
//
//  Created by 石井 幸次 on 2013/11/01.
//  Copyright (c) 2013年 Kouji Ishii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KODetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

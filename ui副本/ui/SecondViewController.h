//
//  SecondViewController.h
//  ui
//
//  Created by koutiancong on 15/8/18.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *height;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *edit;

@property (strong, nonatomic) IBOutlet ADBannerView *bannerView;

@property (assign, nonatomic) NSMutableArray *array;

@end


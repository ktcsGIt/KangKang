//
//  FirstViewController.h
//  ui
//
//  Created by koutiancong on 15/8/18.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *labelZ;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *water1;
@property (weak, nonatomic) IBOutlet UIImageView *water2;
@property (weak, nonatomic) IBOutlet UIImageView *water3;
@property (weak, nonatomic) IBOutlet UIImageView *water4;
@property (weak, nonatomic) IBOutlet UIImageView *water5;
@property (weak, nonatomic) IBOutlet UIImageView *water6;
@property (weak, nonatomic) IBOutlet UIImageView *water7;
@property (weak, nonatomic) IBOutlet UIImageView *water8;

@property (weak, nonatomic) IBOutlet UIButton *addWater;

- (IBAction)addWater:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *breakfastImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lunchImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dinnerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *snackImageView;

@property (weak, nonatomic) IBOutlet UILabel *breakfastLabel;
@property (weak, nonatomic) IBOutlet UILabel *lunchLabel;
@property (weak, nonatomic) IBOutlet UILabel *dinnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *snackLabel;

@property (strong, nonatomic) NSMutableArray *array;

@property (strong, nonatomic) NSMutableArray *arraySum;

@property (nonatomic,strong) NSMutableArray* arrayb;
@property (nonatomic,strong) NSMutableArray* arrayl;
@property (nonatomic,strong) NSMutableArray* arrayd;
@property (nonatomic,strong) NSMutableArray* arrays;

@property (strong, nonatomic) NSMutableArray *arrayW;
@property (strong, nonatomic) NSMutableArray *arrayW1;
@property (strong, nonatomic) NSMutableArray *arrayW2;
@property (strong, nonatomic) NSMutableArray *arrayW3;

- (NSString *)applicationDocumentsDirectoryFileForBreakfast;
- (NSString *)applicationDocumentsDirectoryFileForLunch;
- (NSString *)applicationDocumentsDirectoryFileForDinner;
- (NSString *)applicationDocumentsDirectoryFileForSnack;

- (void) choosePictureForShui;


@end


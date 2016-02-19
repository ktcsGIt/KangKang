//
//  ThirdViewController.h
//  ui
//
//  Created by koutiancong on 15/8/27.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *run;
@property (weak, nonatomic) IBOutlet UIImageView *walk;
@property (weak, nonatomic) IBOutlet UIImageView *basketball;
@property (weak, nonatomic) IBOutlet UIImageView *pingpang;
@property (weak, nonatomic) IBOutlet UIImageView *swim;
@property (weak, nonatomic) IBOutlet UIImageView *bike;
@property (weak, nonatomic) IBOutlet UIImageView *skip;

@property (strong, nonatomic) NSMutableArray *arraySum;

@property (nonatomic,strong) NSMutableArray* arrayb;
@property (nonatomic,strong) NSMutableArray* arrayl;
@property (nonatomic,strong) NSMutableArray* arrayd;
@property (nonatomic,strong) NSMutableArray* arrays;

- (NSString *)applicationDocumentsDirectoryFileForBreakfast;
- (NSString *)applicationDocumentsDirectoryFileForLunch;
- (NSString *)applicationDocumentsDirectoryFileForDinner;
- (NSString *)applicationDocumentsDirectoryFileForSnack;

@end

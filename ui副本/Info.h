//
//  Info.h
//  ui
//
//  Created by koutiancong on 15/8/22.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Info : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *man;
@property (weak, nonatomic) IBOutlet UIButton *woman;
@property (weak, nonatomic) IBOutlet UIImageView *isMan;
@property (weak, nonatomic) IBOutlet UIImageView *isWoman;


@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *age;

- (IBAction)man:(id)sender;
- (IBAction)woman:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *done;
- (IBAction)done:(id)sender;


@property (strong, nonatomic) NSMutableArray *array;
@property (strong, nonatomic) NSMutableArray *array2;
@property (strong, nonatomic) NSMutableArray *arraym;
@property (strong, nonatomic) NSMutableArray *arrayw;
@property (strong, nonatomic) NSMutableArray *arrayMan;
@property (strong, nonatomic) NSMutableArray *arrayWoman;

@end

//
//  ThirdViewController.m
//  ui
//
//  Created by koutiancong on 15/8/27.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    //CGFloat height = size.height;
    
    self.scrollView.contentSize = CGSizeMake(width,1000);
    
    CALayer * layer = [self.label layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:50.0];
    [layer setBorderWidth:2];
    [layer setBorderColor:[UIColor whiteColor].CGColor];
    
    CALayer * layer1 = [self.run layer];
    [layer1 setMasksToBounds:YES];
    [layer1 setCornerRadius:10.0];
    
    CALayer * layer2 = [self.walk layer];
    [layer2 setMasksToBounds:YES];
    [layer2 setCornerRadius:10.0];
    
    CALayer * layer3 = [self.basketball layer];
    [layer3 setMasksToBounds:YES];
    [layer3 setCornerRadius:10.0];
    
    CALayer * layer4 = [self.pingpang layer];
    [layer4 setMasksToBounds:YES];
    [layer4 setCornerRadius:10.0];
    
    CALayer * layer5 = [self.swim layer];
    [layer5 setMasksToBounds:YES];
    [layer5 setCornerRadius:10.0];
    
    CALayer * layer6 = [self.bike layer];
    [layer6 setMasksToBounds:YES];
    [layer6 setCornerRadius:10.0];
    
    CALayer * layer7 = [self.skip layer];
    [layer7 setMasksToBounds:YES];
    [layer7 setCornerRadius:10.0];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)applicationDocumentsDirectoryFileForBreakfast {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"breakfastList.plist"];
    
    return path;
}

- (NSString *)applicationDocumentsDirectoryFileForLunch {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"lunchList.plist"];
    
    return path;
}

- (NSString *)applicationDocumentsDirectoryFileForDinner {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"dinnerList.plist"];
    
    return path;
}

- (NSString *)applicationDocumentsDirectoryFileForSnack {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"snackList.plist"];
    
    return path;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    NSString *pathB = [self applicationDocumentsDirectoryFileForBreakfast];
    self.arrayb = [[NSMutableArray alloc] initWithContentsOfFile:pathB];
    
    
    int sum = 0;
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc]init];
    NSString *str1 = [[NSString alloc]init];
    
    for(int i = 0; i < self.arrayb.count; i++ ){
        
        dic1 = [self.arrayb objectAtIndex:i];
        str1 = [dic1 objectForKey:@"shu"];
        
        int newString = [str1 intValue];
        
        sum = sum + newString;
        
    }
    
    
    
    
    
    NSString *pathL = [self applicationDocumentsDirectoryFileForLunch];
    self.arrayl = [[NSMutableArray alloc] initWithContentsOfFile:pathL];
    
    
    int sumL = 0;
    NSMutableDictionary *dicL = [[NSMutableDictionary alloc]init];
    NSString *strL = [[NSString alloc]init];
    
    for(int i = 0; i < self.arrayl.count; i++ ){
        
        dicL = [self.arrayl objectAtIndex:i];
        strL = [dicL objectForKey:@"shu"];
        
        int newStringL = [strL intValue];
        
        sumL = sumL + newStringL;
        
    }
    
    
    
    
    
    NSString *pathD = [self applicationDocumentsDirectoryFileForDinner];
    self.arrayd = [[NSMutableArray alloc] initWithContentsOfFile:pathD];
    
    
    int sumD = 0;
    NSMutableDictionary *dicD = [[NSMutableDictionary alloc]init];
    NSString *strD = [[NSString alloc]init];
    
    for(int i = 0; i < self.arrayd.count; i++ ){
        
        dicD = [self.arrayd objectAtIndex:i];
        strD = [dicD objectForKey:@"shu"];
        
        int newStringD = [strD intValue];
        
        sumD = sumD + newStringD;
        
    }
    
    
    
   
    
    NSString *pathS = [self applicationDocumentsDirectoryFileForSnack];
    self.arrays = [[NSMutableArray alloc] initWithContentsOfFile:pathS];
    
    
    int sumS = 0;
    NSMutableDictionary *dicS = [[NSMutableDictionary alloc]init];
    NSString *strS = [[NSString alloc]init];
    
    for(int i = 0; i < self.arrays.count; i++ ){
        
        dicS = [self.arrays objectAtIndex:i];
        strS = [dicS objectForKey:@"shu"];
        
        int newStringS = [strS intValue];
        
        sumS = sumS + newStringS;
        
    }
    
    
    
    
    
    int sumSS = 0;
    sumSS = sum + sumL + sumD + sumS;

    
    
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *pathSum = [documentDirectory stringByAppendingPathComponent:@"person.plist"];
    self.arraySum = [[NSMutableArray alloc] initWithContentsOfFile:pathSum];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    NSString *strHeight = [[NSString alloc]init];
    NSString *strWeight = [[NSString alloc]init];
    NSString *strAge = [[NSString alloc]init];
    NSString *strSex = [[NSString alloc]init];
    
    dic = [self.arraySum objectAtIndex:0];
    strHeight = [dic objectForKey:@"height"];
    strWeight = [dic objectForKey:@"weight"];
    strAge = [dic objectForKey:@"age"];
    strSex = [dic objectForKey:@"sex"];
    
    if ([strSex isEqualToString: @"man"]) {
        
        float manSum = 0;
        
        float heightNumber = [strHeight intValue];
        float weightNumber = [strWeight intValue];
        float ageNumber = [strAge intValue];
        
        manSum = 66 + 13.7*weightNumber + 5*heightNumber - 6.8*ageNumber;
        int manSSS = 0;
        manSSS = ceil(manSum);
        
        int sp = 0;
        sp = sumSS - manSum;
        
        NSString *SSMS = [NSString stringWithFormat:@"%d",sp];
        
        self.label.text = SSMS;
        
        if (sp < 0) {
            self.label.text = @"请填食物表";
        }
        
    } else {
        
        float womanSum = 0;
        
        float heightNumber = [strHeight intValue];
        float weightNumber = [strWeight intValue];
        float ageNumber = [strAge intValue];
        
        womanSum = 655 + 9.6*weightNumber + 1.8*heightNumber - 4.7*ageNumber;
        int womanSSS = 0;
        womanSSS = ceil(womanSum);
        
        int sp = 0;
        sp = sumSS - womanSum;
        
        NSString *SSWS = [NSString stringWithFormat:@"%d",womanSSS];
        self.label.text = SSWS;
        
        if (sp < 0) {
            self.label.text = @"请填食物表";
        }
        
    }
    
    
    
    
}


@end

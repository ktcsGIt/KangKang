//
//  SecondViewController.m
//  ui
//
//  Created by koutiancong on 15/8/18.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bannerView = [[ADBannerView alloc]initWithAdType:ADAdTypeBanner];
    self.bannerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.bannerView.delegate = self;
    [self.view addSubview:self.bannerView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)applicationDocumentsDirectoryFile {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"person.plist"];
    
    return path;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    CALayer * layer = [self.edit layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:5.0];
    
    CALayer * layerI = [self.imageView layer];
    [layerI setMasksToBounds:YES];
    [layerI setCornerRadius:10.0];
    
    NSString *path = [self applicationDocumentsDirectoryFile];
    self.array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    NSString *strH = [[NSString alloc]init];
    NSString *strW = [[NSString alloc]init];
    NSString *strA = [[NSString alloc]init];
    NSString *strSex = [[NSString alloc]init];
    
    dic = [self.array objectAtIndex:0];
    strH = [dic objectForKey:@"height"];
    strW = [dic objectForKey:@"weight"];
    strA = [dic objectForKey:@"age"];
    strSex = [dic objectForKey:@"sex"];
    
    self.height.text = strH;
    self.weight.text = strW;
    self.age.text = strA;
    
    
    if ([strSex isEqualToString: @"man"]) {
        [self.imageView setImage:[UIImage imageNamed:@"boy.png"]];
    } else {
        [self.imageView setImage:[UIImage imageNamed:@"girl.png"]];
    }
    
}


@end

//
//  FirstViewController.m
//  ui
//
//  Created by koutiancong on 15/8/18.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    //CGFloat height = size.height;
    
    self.scrollView.contentSize = CGSizeMake(width,1000);
    
    
    CALayer * layer1 = [self.label1 layer];
    [layer1 setMasksToBounds:YES];
    [layer1 setCornerRadius:35.0];
    [layer1 setBorderWidth:2];
    [layer1 setBorderColor:[UIColor whiteColor].CGColor];
    
    CALayer * layer2 = [self.label2 layer];
    [layer2 setMasksToBounds:YES];
    [layer2 setCornerRadius:35.0];
    [layer2 setBorderWidth:2];
    [layer2 setBorderColor:[UIColor whiteColor].CGColor];

    
    CALayer * layerB = [self.breakfastImageView layer];
    [layerB setMasksToBounds:YES];
    [layerB setCornerRadius:10.0];
    CALayer * layerL = [self.lunchImageView layer];
    [layerL setMasksToBounds:YES];
    [layerL setCornerRadius:10.0];
    CALayer * layerD = [self.dinnerImageView layer];
    [layerD setMasksToBounds:YES];
    [layerD setCornerRadius:10.0];
    CALayer * layerS = [self.snackImageView layer];
    [layerS setMasksToBounds:YES];
    [layerS setCornerRadius:10.0];
    
    CALayer * layerButton = [self.addWater layer];
    [layerButton setCornerRadius:5.0];
    
    
    NSString *documentDirectoryS = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *pathSh = [documentDirectoryS stringByAppendingPathComponent:@"shui.plist"];
    self.arrayW = [[NSMutableArray alloc] initWithContentsOfFile:pathSh];
    if (self.arrayW == nil) {
        NSMutableArray *arrayWS = [[NSMutableArray alloc] init];
        
        NSDictionary* dict = [NSDictionary
                              dictionaryWithObjects:@[@"0",@"1"]
                              forKeys:@[@"s",@"shu"]];
        
        [arrayWS addObject:dict];
        [arrayWS writeToFile:pathSh atomically:YES];
        
    }
    
    
    NSDateFormatter *dateFormator = [[NSDateFormatter alloc] init];
    dateFormator.dateFormat = @"yyyy-MM-dd";
    NSDate *now = [NSDate date];
    NSString* dateString = [dateFormator stringFromDate:now];
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"dateForDelate.plist"];
    self.array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    NSString *str0 = [[NSString alloc]init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic = [self.array objectAtIndex:self.array.count-1];
    str0 = [dic objectForKey:@"date1"];
    
    if ([dateString isEqual:str0] ) {
        
        NSLog(@"还是今天");
        
    } else {
        
        NSLog(@"不是今天");
        
        NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [documentDirectory stringByAppendingPathComponent:@"dateForDelate.plist"];
        NSMutableArray *arrayQing = [[NSMutableArray alloc]init];
        
        
        
        NSDictionary* dict = [NSDictionary
                              dictionaryWithObjects:@[dateString,dateString]
                              forKeys:@[@"date1",@"date2"]];
        
        [arrayQing addObject:dict];
        
        [arrayQing writeToFile:path atomically:YES];
        
        //还原shui.plist
        NSString *documentDirectoryShui = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *pathShui = [documentDirectoryShui stringByAppendingPathComponent:@"shui.plist"];
        
        self.arrayW3 = [[NSMutableArray alloc] initWithContentsOfFile:pathShui];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        dic = [self.arrayW3 objectAtIndex:self.arrayW3.count-1];
        
        [dic setValue:@"0" forKey:@"s"];
        [self.arrayW3 writeToFile:pathShui atomically:YES];
        
        
        //删除之前的数据
        NSString *path0B = [self applicationDocumentsDirectoryFileForBreakfast];
        NSMutableArray *array0B = [[NSMutableArray alloc] initWithContentsOfFile:path0B];
        
        for (int i = 0; i <= 30 ; i++) {
            for (NSDictionary* dict0B in array0B) {
                
                [array0B removeObject: dict0B];
                [array0B writeToFile:path0B atomically:YES];
                break;
                
            }
        }
        
        NSString *path0L = [self applicationDocumentsDirectoryFileForLunch];
        NSMutableArray *array0L = [[NSMutableArray alloc] initWithContentsOfFile:path0L];
        
        for (int i = 0; i <= 30 ; i++) {
            for (NSDictionary* dict0L in array0L) {
                
                [array0L removeObject: dict0L];
                [array0L writeToFile:path0L atomically:YES];
                break;
                
            }
        }
        
        NSString *path0D = [self applicationDocumentsDirectoryFileForDinner];
        NSMutableArray *array0D = [[NSMutableArray alloc] initWithContentsOfFile:path0D];
        
        for (int i = 0; i <= 30 ; i++) {
            for (NSDictionary* dict0D in array0D) {
                
                [array0D removeObject: dict0D];
                [array0D writeToFile:path0D atomically:YES];
                break;
                
            }
        }
        
        NSString *path0S = [self applicationDocumentsDirectoryFileForSnack];
        NSMutableArray *array0S = [[NSMutableArray alloc] initWithContentsOfFile:path0S];
        
        for (int i = 0; i <= 30 ; i++) {
            for (NSDictionary* dict0S in array0S) {
                
                [array0S removeObject: dict0S];
                [array0S writeToFile:path0S atomically:YES];
                break;
                
            }
        }
        
        
        
    }
    
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
    
    NSString *stringInt = [NSString stringWithFormat:@"%d",sum];
    
    self.breakfastLabel.text = stringInt;
    
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
    
    NSString *stringIntL = [NSString stringWithFormat:@"%d",sumL];
    
    self.lunchLabel.text = stringIntL;
    
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
    
    NSString *stringIntD = [NSString stringWithFormat:@"%d",sumD];
    
    self.dinnerLabel.text = stringIntD;
    
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
    
    NSString *stringIntS = [NSString stringWithFormat:@"%d",sumS];
    
    self.snackLabel.text = stringIntS;
    
    
    //加载水图
    [self choosePictureForShui];
    

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    NSString *stringInt = [NSString stringWithFormat:@"%d",sum];
    
    self.breakfastLabel.text = stringInt;
    
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
    
    NSString *stringIntL = [NSString stringWithFormat:@"%d",sumL];
    
    self.lunchLabel.text = stringIntL;
    
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
    
    NSString *stringIntD = [NSString stringWithFormat:@"%d",sumD];
    
    self.dinnerLabel.text = stringIntD;
    
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
    
    NSString *stringIntS = [NSString stringWithFormat:@"%d",sumS];
    
    self.snackLabel.text = stringIntS;
    
    int sumSS = 0;
    sumSS = sum + sumL + sumD + sumS;
    NSString *stringSS = [NSString stringWithFormat:@"%d",sumSS];
    self.label2.text = stringSS;
    
    self.labelZ.text = @"";
    
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
        NSString *SSM = [NSString stringWithFormat:@"%d",manSSS];
        self.label1.text = SSM;
        
        
    } else {
        
        float womanSum = 0;
        
        float heightNumber = [strHeight intValue];
        float weightNumber = [strWeight intValue];
        float ageNumber = [strAge intValue];
        
        womanSum = 655 + 9.6*weightNumber + 1.8*heightNumber - 4.7*ageNumber;
        int womanSSS = 0;
        womanSSS = ceil(womanSum);
        NSString *SSW = [NSString stringWithFormat:@"%d",womanSSS];
        self.label1.text = SSW;
        
        
    }
    
    if (strHeight.length == 0) {
        self.label1.text = @"?";
    }
    if (strWeight.length == 0) {
        self.label1.text = @"?";
    }
    if (strAge.length == 0) {
        self.label1.text = @"?";
    }
    

}

- (void) choosePictureForShui{
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"shui.plist"];
    
    self.arrayW1 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSString *str = [[NSString alloc]init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic = [self.arrayW1 objectAtIndex:self.arrayW1.count-1];
    str = [dic objectForKey:@"s"];
    int newString = [str intValue];
    
    switch (newString) {
        case 0:
            [self.water1 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            break;
            
        case 1:
            [self.water1 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"wushui.jpg"]];            break;
        case 2:
            [self.water1 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            break;
        case 3:
            [self.water1 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            break;
        case 4:
            [self.water1 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            break;
        case 5:
            [self.water1 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            break;
        case 6:
            [self.water1 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            break;
        case 7:
            [self.water1 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"wushui.jpg"]];
            break;
        default:
            [self.water1 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water2 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water3 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water4 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water5 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water6 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water7 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            [self.water8 setImage:[UIImage imageNamed:@"youshui.jpg"]];
            break;
    }
}


- (IBAction)addWater:(id)sender {
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"shui.plist"];
    
    
    self.arrayW2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSString *str = [[NSString alloc]init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic = [self.arrayW2 objectAtIndex:self.arrayW2.count-1];
    str = [dic objectForKey:@"s"];
    int newString = [str intValue];
    newString = newString + 1;
    NSString *stringInt = [NSString stringWithFormat:@"%d",newString];
    
    [dic setValue:stringInt forKey:@"s"];
    
    [self.arrayW2 writeToFile:path atomically:YES];
    
    [self choosePictureForShui];
    
}
@end

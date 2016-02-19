//
//  Info.m
//  ui
//
//  Created by koutiancong on 15/8/22.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "Info.h"

@interface Info ()

@end

@implementation Info

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer * layerButton = [self.done layer];
    [layerButton setCornerRadius:5.0];
    
    CALayer * layerM = [self.man layer];
    [layerM setMasksToBounds:YES];
    [layerM setCornerRadius:10.0];
    
    CALayer * layerW = [self.woman layer];
    [layerW setMasksToBounds:YES];
    [layerW setCornerRadius:10.0];

    
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"person.plist"];
    self.array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    if (self.array == nil) {
        NSMutableArray *arrayI = [[NSMutableArray alloc] init];
        
        NSDictionary* dict = [NSDictionary
                              dictionaryWithObjects:@[@"180",@"70",@"20",@"man"]
                              forKeys:@[@"height",@"weight",@"age",@"sex"]];
        
        [arrayI addObject:dict];
        [arrayI writeToFile:path atomically:YES];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)man:(id)sender {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"person.plist"];
    
    
    self.arraym = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic = [self.arraym objectAtIndex:self.arraym.count-1];
    
    [dic setValue:@"man" forKey:@"sex"];
    
    [self.arraym writeToFile:path atomically:YES];
    
    [self.isMan setImage:[UIImage imageNamed:@"gou.png"]];
    [self.isWoman setImage:[UIImage imageNamed:@""]];
    
}

- (IBAction)woman:(id)sender {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"person.plist"];
    
    
    self.arrayw = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic = [self.arrayw objectAtIndex:self.arrayw.count-1];
    
    [dic setValue:@"woman" forKey:@"sex"];
    
    [self.arrayw writeToFile:path atomically:YES];
    
    [self.isMan setImage:[UIImage imageNamed:@""]];
    [self.isWoman setImage:[UIImage imageNamed:@"gou.png"]];
}

- (IBAction)done:(id)sender {
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"person.plist"];
    
    
    self.array2 = [[NSMutableArray alloc] initWithContentsOfFile:path];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    dic = [self.array2 objectAtIndex:self.array2.count-1];
    
    NSString *strH = self.height.text;
    NSString *strW = self.weight.text;
    NSString *strE = self.age.text;
    
    [dic setValue:strH forKey:@"height"];
    [dic setValue:strW forKey:@"weight"];
    [dic setValue:strE forKey:@"age"];
    
    [self.array2 writeToFile:path atomically:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}



//通过委托来实现放弃第一响应者
#pragma mark - UITextField Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.height resignFirstResponder];
    [self.weight resignFirstResponder];
    [self.age resignFirstResponder];
}

@end

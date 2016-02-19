//
//  BreakfastMaster.m
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "BreakfastMaster.h"

@interface BreakfastMaster ()

@end

@implementation BreakfastMaster

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bl = [[NoteBLBreakfast alloc] init];
    self.listData = [self.bl findAllForBreakfast];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadView:)
                                                 name:@"reloadViewNotification"
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"  forIndexPath:indexPath];
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    NoteBreakfast  *note = self.listData[indexPath.row];
    cell.textLabel.text = note.content;
    //    cell.detailTextLabel.text = [note.date description];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NoteBLBreakfast *note = [self.listData objectAtIndex:[indexPath row]];
        NoteBLBreakfast *bl = [[NoteBLBreakfast alloc] init];
        self.listData = [bl removeBreakfast: note];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}



#pragma mark - 处理通知
-(void)reloadView:(NSNotification*)notification
{
    NSMutableArray *resList = [notification object];
    self.listData  = resList;
    [self.tableView reloadData];
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

//
//  DinnerTableView.m
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "DinnerTableView.h"

@interface DinnerTableView ()

@end

@implementation DinnerTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设定搜索栏ScopeBar隐藏
    [self.searchBar setShowsScopeBar:NO];
    [self.searchBar sizeToFit];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"food"
                                           ofType:@"plist"];
    //获取属性列表文件中的全部数据
    self.listFood = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    //初次进入查询所有数据
    [self filterContentForSearchText:@"" scope:-1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Content Filtering
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSUInteger)scope;
{
    
    
    if([searchText length]==0)
    {
        //查询所有
        self.listFilterFood = [NSMutableArray arrayWithArray:self.listFood];
        return;
    }
    
    NSPredicate *scopePredicate;
    NSArray *tempArray ;
    
    scopePredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    tempArray =[self.listFood filteredArrayUsingPredicate:scopePredicate];
    self.listFilterFood = [NSMutableArray arrayWithArray:tempArray];
    
    
    self.listFilterFood = [NSMutableArray arrayWithArray:tempArray];
    
    
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listFilterFood count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSInteger row = [indexPath row];
    NSDictionary *dict = [self.listFilterFood objectAtIndex:row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoteBLDinner *bl = [[NoteBLDinner alloc] init];
    NoteDinner *note = [[NoteDinner alloc] init];
    note.date = [[NSDate alloc] init];
//    NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
    
    NSDictionary *dict = [self.listFilterFood objectAtIndex:indexPath.row];
    note.content =  [dict objectForKey:@"name"];
    note.shu = [dict objectForKey:@"cal"];
    
    
    NSMutableArray *reslist = [bl createNoteForDinner: note];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadViewNotification" object:reslist userInfo:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --UISearchBarDelegate 协议方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //查询所有
    [self filterContentForSearchText:@"" scope:-1];
}

#pragma mark - UISearchDisplayController Delegate Methods
//当文本内容发生改变时候，向表视图数据源发出重新加载消息
- (BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:self.searchBar.selectedScopeButtonIndex];
    //YES情况下表视图可以重新加载
    return YES;
}

// 当Scope Bar选择发送变化时候，向表视图数据源发出重新加载消息
- (BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:self.searchBar.text scope:searchOption];
    // YES情况下表视图可以重新加载
    return YES;
}

@end

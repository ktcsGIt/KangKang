//
//  DinnerTableView.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DinnerMaster.h"
#import "NoteBLDinner.h"
#import "NoteDinner.h"
#import "NoteDAODinner.h"

@interface DinnerTableView : UITableViewController

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@property (nonatomic, strong) NSArray *listFood;
@property (nonatomic, strong) NSMutableArray *listFilterFood;

@property (nonatomic, strong) NSString *str;

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSUInteger)scope;

@end

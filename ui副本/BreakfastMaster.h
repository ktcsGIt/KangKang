//
//  BreakfastMaster.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteBreakfast.h"
#import "NoteDAOBreakfast.h"
#import "NoteBLBreakfast.h"

@interface BreakfastMaster : UITableViewController
- (IBAction)done:(id)sender;

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;

//保存数据列表
@property (nonatomic,strong) NoteBLBreakfast* bl;

@end

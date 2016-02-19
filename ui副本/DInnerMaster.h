//
//  DInnerMaster.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteDinner.h"
#import "NoteDAODinner.h"
#import "NoteBLDinner.h"

@interface DInnerMaster : UITableViewController
- (IBAction)done:(id)sender;

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;

//保存数据列表
@property (nonatomic,strong) NoteBLDinner* bl;

@end

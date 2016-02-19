//
//  LunchMaster.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteLunch.h"
#import "NoteDAOLunch.h"
#import "NoteBLLunch.h"


@interface LunchMaster : UITableViewController
- (IBAction)done:(id)sender;

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;

//保存数据列表
@property (nonatomic,strong) NoteBLLunch* bl;

@end

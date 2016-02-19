//
//  NoteDAOBreakfast.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteBreakfast.h"

@interface NoteDAOBreakfast : NSObject

+ (NoteDAOBreakfast*)sharedManager;

- (NSString *)applicationDocumentsDirectoryFileForBreakfast;
- (void)createEditableCopyOfDatabaseIfNeededForBreakfast;

//插入Note方法
-(int) create:(NoteBreakfast*)model;

//删除Note方法
-(int) remove:(NoteBreakfast*)model;

//修改Note方法
-(int) modify:(NoteBreakfast*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

@end

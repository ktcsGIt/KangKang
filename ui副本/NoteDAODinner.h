//
//  NoteDAODinner.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteDinner.h"

@interface NoteDAODinner : NSObject

+ (NoteDAODinner*)sharedManager;

- (NSString *)applicationDocumentsDirectoryFileForDinner;
- (void)createEditableCopyOfDatabaseIfNeededForDinner;

//插入Note方法
-(int) create:(NoteDinner*)model;

//删除Note方法
-(int) remove:(NoteDinner*)model;

//修改Note方法
-(int) modify:(NoteDinner*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

@end

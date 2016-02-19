//
//  NoteDAOSnack.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteSnack.h"

@interface NoteDAOSnack : NSObject

+ (NoteDAOSnack*)sharedManager;

- (NSString *)applicationDocumentsDirectoryFileForSnack;
- (void)createEditableCopyOfDatabaseIfNeededForSnack;

//插入Note方法
-(int) create:(NoteSnack*)model;

//删除Note方法
-(int) remove:(NoteSnack*)model;

//修改Note方法
-(int) modify:(NoteSnack*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

@end

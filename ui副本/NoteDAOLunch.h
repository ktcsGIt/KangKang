//
//  NoteDAOLunch.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteLunch.h"

@interface NoteDAOLunch : NSObject

+ (NoteDAOLunch*)sharedManager;

- (NSString *)applicationDocumentsDirectoryFileForLunch;
- (void)createEditableCopyOfDatabaseIfNeededForLunch;

//插入Note方法
-(int) create:(NoteLunch*)model;

//删除Note方法
-(int) remove:(NoteLunch*)model;

//修改Note方法
-(int) modify:(NoteLunch*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

@end

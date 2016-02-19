//
//  NoteBLBreakfast.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteBreakfast.h"
#import "NoteDAOBreakfast.h"

@interface NoteBLBreakfast : NSObject

//插入Note方法
-(NSMutableArray*) createNoteForBreakfast:(NoteBreakfast*)model;

//删除Note方法
-(NSMutableArray*) removeBreakfast:(NoteBreakfast*)model;

//查询所用数据方法
-(NSMutableArray*) findAllForBreakfast;

@end

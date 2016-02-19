//
//  NoteBLSnack.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteSnack.h"
#import "NoteDAOSnack.h"

@interface NoteBLSnack : NSObject

//插入Note方法
-(NSMutableArray*) createNoteForSnack:(NoteSnack*)model;

//删除Note方法
-(NSMutableArray*) removeSnack:(NoteSnack*)model;

//查询所用数据方法
-(NSMutableArray*) findAllForSnack;

@end

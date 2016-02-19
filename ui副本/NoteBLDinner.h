//
//  NoteBLDinner.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteDinner.h"
#import "NoteDAODinner.h"

@interface NoteBLDinner : NSObject

//插入Note方法
-(NSMutableArray*) createNoteForDinner:(NoteDinner*)model;

//删除Note方法
-(NSMutableArray*) removeDinner:(NoteDinner*)model;

//查询所用数据方法
-(NSMutableArray*) findAllForDinner;

@end

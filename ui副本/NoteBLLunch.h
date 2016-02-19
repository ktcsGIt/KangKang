//
//  NoteBLLunch.h
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteLunch.h"
#import "NoteDAOLunch.h"

@interface NoteBLLunch : NSObject

//插入Note方法
-(NSMutableArray*) createNoteForLunch:(NoteLunch*)model;

//删除Note方法
-(NSMutableArray*) removeLunch:(NoteLunch*)model;

//查询所用数据方法
-(NSMutableArray*) findAllForLunch;

@end

//
//  NoteBLBreakfast.m
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "NoteBLBreakfast.h"

@implementation NoteBLBreakfast

//插入Note方法
-(NSMutableArray*) createNoteForBreakfast:(NoteBreakfast *)model
{
    NoteDAOBreakfast *dao = [NoteDAOBreakfast sharedManager];
    [dao create:model];
    
    return [dao findAll];
}

//删除Note方法
-(NSMutableArray*) removeBreakfast:(NoteBreakfast *)model
{
    NoteDAOBreakfast *dao = [NoteDAOBreakfast sharedManager];
    [dao remove:model];
    
    return [dao findAll];
}

//查询所用数据方法
-(NSMutableArray*) findAllForBreakfast
{
    NoteDAOBreakfast *dao = [NoteDAOBreakfast sharedManager];
    return [dao findAll];
}

@end

//
//  NoteBLLunch.m
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "NoteBLLunch.h"

@implementation NoteBLLunch

//插入Note方法
-(NSMutableArray*) createNoteForLunch:(NoteLunch *)model
{
    NoteDAOLunch *dao = [NoteDAOLunch sharedManager];
    [dao create:model];
    
    return [dao findAll];
}

//删除Note方法
-(NSMutableArray*) removeLunch:(NoteLunch *)model
{
    NoteDAOLunch *dao = [NoteDAOLunch sharedManager];
    [dao remove:model];
    
    return [dao findAll];
}

//查询所用数据方法
-(NSMutableArray*) findAllForLunch
{
    NoteDAOLunch *dao = [NoteDAOLunch sharedManager];
    return [dao findAll];
}

@end

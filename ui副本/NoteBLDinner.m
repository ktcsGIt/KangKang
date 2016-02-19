//
//  NoteBLDinner.m
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "NoteBLDinner.h"

@implementation NoteBLDinner

//插入Note方法
-(NSMutableArray*) createNoteForDinner:(NoteDinner *)model
{
    NoteDAODinner *dao = [NoteDAODinner sharedManager];
    [dao create:model];
    
    return [dao findAll];
}

//删除Note方法
-(NSMutableArray*) removeDinner:(NoteDinner *)model
{
    NoteDAODinner *dao = [NoteDAODinner sharedManager];
    [dao remove:model];
    
    return [dao findAll];
}

//查询所用数据方法
-(NSMutableArray*) findAllForDinner
{
    NoteDAODinner *dao = [NoteDAODinner sharedManager];
    return [dao findAll];
}

@end

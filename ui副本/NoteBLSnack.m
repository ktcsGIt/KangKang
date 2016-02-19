//
//  NoteBLSnack.m
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "NoteBLSnack.h"

@implementation NoteBLSnack

//插入Note方法
-(NSMutableArray*) createNoteForSnack:(NoteSnack *)model
{
    NoteDAOSnack *dao = [NoteDAOSnack sharedManager];
    [dao create:model];
    
    return [dao findAll];
}

//删除Note方法
-(NSMutableArray*) removeSnack:(NoteSnack *)model
{
    NoteDAOSnack *dao = [NoteDAOSnack sharedManager];
    [dao remove:model];
    
    return [dao findAll];
}

//查询所用数据方法
-(NSMutableArray*) findAllForSnack
{
    NoteDAOSnack *dao = [NoteDAOSnack sharedManager];
    return [dao findAll];
}

@end

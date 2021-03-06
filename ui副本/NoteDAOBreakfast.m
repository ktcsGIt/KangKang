//
//  NoteDAOBreakfast.m
//  ui
//
//  Created by koutiancong on 15/8/21.
//  Copyright (c) 2015年 koutiancong. All rights reserved.
//

#import "NoteDAOBreakfast.h"

@implementation NoteDAOBreakfast

static NoteDAOBreakfast *sharedManager = nil;

+ (NoteDAOBreakfast*)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[self alloc] init];
        [sharedManager createEditableCopyOfDatabaseIfNeededForBreakfast];
    });
    return sharedManager;
}


- (void)createEditableCopyOfDatabaseIfNeededForBreakfast {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *writableDBPath = [self applicationDocumentsDirectoryFileForBreakfast];
    
    BOOL dbexits = [fileManager fileExistsAtPath:writableDBPath];
    if (!dbexits) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"breakfastList.plist"];
        
        NSError *error;
        BOOL success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if (!success) {
            NSAssert1(0, @"错误写入文件：'%@'。", [error localizedDescription]);
        }
    }
}

- (NSString *)applicationDocumentsDirectoryFileForBreakfast {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"breakfastList.plist"];
    
    return path;
}

//插入Note方法
-(int) create:(NoteBreakfast*)model
{
    NSString *path = [self applicationDocumentsDirectoryFileForBreakfast];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDictionary* dict = [NSDictionary
                          dictionaryWithObjects:@[[dateFormat stringFromDate: model.date],model.content,model.shu]
                          forKeys:@[@"date",@"content",@"shu"]];
    
    [array addObject:dict];
    
    [array writeToFile:path atomically:YES];
    
    return 0;
}

//删除Note方法
-(int) remove:(NoteBreakfast*)model
{
    NSString *path = [self applicationDocumentsDirectoryFileForBreakfast];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    for (NSDictionary* dict in array) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        //Note* note = [[Note alloc] init];
        NSDate *date = [dateFormatter dateFromString:[dict objectForKey:@"date"]];
        //note.content = [dict objectForKey:@"content"];
        
        //比较日期主键是否相等
        if ([date isEqualToDate:model.date]){
            [array removeObject: dict];
            [array writeToFile:path atomically:YES];
            break;
        }
    }
    
    return 0;
}

//修改Note方法
-(int) modify:(NoteBreakfast*)model
{
    
    NSString *path = [self applicationDocumentsDirectoryFileForBreakfast];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    for (NSDictionary* dict in array) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NSDate *date = [dateFormatter dateFromString:[dict objectForKey:@"date"]];
        NSString* content = [dict objectForKey:@"content"];
        NSString* shu = [dict objectForKey:@"shu"];
        
        //比较日期主键是否相等
        if ([date isEqualToDate:model.date]){
            [dict setValue:content forKey:@"content"];
            [dict setValue:shu forKey:@"shu"];
            [array writeToFile:path atomically:YES];
            break;
        }
    }
    return 0;
}

//查询所有数据方法
-(NSMutableArray*) findAll
{
    NSString *path = [self applicationDocumentsDirectoryFileForBreakfast];
    
    //[self.listData removeAllObjects];
    NSMutableArray *listData = [[NSMutableArray alloc] init];
    
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    for (NSDictionary* dict in array) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NoteBreakfast* note = [[NoteBreakfast alloc] init];
        note.date = [dateFormatter dateFromString:[dict objectForKey:@"date"]];
        note.content = [dict objectForKey:@"content"];
        note.shu = [dict objectForKey:@"shu"];
        
        [listData addObject:note];
        
    }
    return listData;
}

@end

//
//  GameCaretaker.m
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GameCaretaker.h"

@implementation GameCaretaker


//初始化本地数据库
+ (void)CreateTabeviewDB{
    
    NSString* homeDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSString *DbString = @"meituan_cities.db";
    
    NSString *databasePath = [homeDir stringByAppendingPathComponent:DbString];
    
    [[JRDBMgr shareInstance] setDefaultDatabasePath:databasePath];
    
    [[JRDBMgr shareInstance]registerClazzes:@[
                                              
                                              [GameMemo class]
                                              
                                              ]];
    
    [JRDBMgr shareInstance].debugMode = YES;
    
}

//保存本地数据
+ (void)saveGzMessage:(GameMemo*)model  isFinished:(OperatingBlock)isFinished{
    
    BOOL result = J_Insert(model)
    .InDB([JRDBMgr shareInstance].getHandler) // by Default
    .Recursive(YES)                 // by default
    .Sync(YES)                 // by default
    .Transaction(YES)          // by default
    .updateResult;             // 执行
    
    isFinished(result);
    
}


+ (void)UpdateGzGameMemoModel:(GameMemo*)model isFinished:(OperatingBlock)isFinished{
    
    BOOL result = J_Update(model)
    .Columns(@[@"point", @"level"])  // 更新指定列
    //    .Ignore(@[@"age", @"name"])   // 忽略指定列
    .InDB([JRDBMgr shareInstance].getHandler)      // by default
    .Recursive(YES)                  // by default
    .Sync(YES)                      // by default
    .Transaction(YES)               // by default
    .updateResult;                  // 执行
    
    isFinished(result);
    
}


//删除本地数据
+ (void)DeleteModel:(GameMemo*)model  isFinished:(OperatingBlock)isFinished{
    
    // 删除
    BOOL result = J_Delete(model)
    .InDB([JRDBMgr shareInstance].getHandler)      // by default
    .Recursive(YES)                  // by default
    .Sync(YES)                      // by default
    .Transaction(YES)               // by default
    .updateResult;                  // 执行
    
    isFinished(result);
    
}

+ (void)DeleteAllModelisFinished:(OperatingBlock)isFinished{
    
    [GameCaretaker SearchModelisFinished:^(BOOL isSuccess, NSArray<GameMemo *> * _Nonnull Array) {
       
        if(Array.count > 0){
            [Array enumerateObjectsUsingBlock:^(GameMemo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [GameCaretaker DeleteModel:obj isFinished:^(BOOL isSuccess) {
                   
                    if(idx == Array.count -1){
                        if(isSuccess){
                            isFinished(YES);
                        }else{
                            NSLog(@"没有删除成功");
                        }
                    }
                    
                }];
            }];
        }else{
            isFinished(YES);
        }
        
    }];
    
}



+ (void)SearchModelForDeviceId:(NSString *)Deviceid  isFinished:(SingleSearchBlock)isFinished{
    
    NSArray<GameMemo *>* Array =
    J_Select(GameMemo)
    .And(@"Id").eq(Deviceid)
    .Recursive(YES)
    .list;
    
    if(Array.count > 0){
        isFinished(YES,[Array objectAtIndex:0]);
    }else{
        isFinished(NO,[GameMemo new]);
    }
    
    
}



//拿到所有的这个类的本地数据
+ (void)SearchModelisFinished:(AllSearchBlock)isFinished{
    
    // 普通查询
    NSArray<GameMemo *> *result =
    J_Select(GameMemo)
    .Recursive(YES)    // 指定查询对象
    .list;
    isFinished(result.count != 0,result);
    
}


+ (NSInteger)SearchModelCount{
    
    NSInteger count =
    J_Select(GameMemo)
    .Recursive(YES)    // 指定查询对象
    .list
    .count;
    return count;
}


@end

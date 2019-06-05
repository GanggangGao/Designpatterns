//
//  GameCaretaker.h
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JRDB.h>
#import "GameMemo.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^OperatingBlock)(BOOL isSuccess);
typedef void(^SingleSearchBlock)(BOOL isSuccess,GameMemo *Memo);
typedef void(^AllSearchBlock)(BOOL isSuccess,NSArray<GameMemo*> *Array);

@interface GameCaretaker : NSObject

+ (void)CreateTabeviewDB; //init

+ (void)SearchModelForDeviceId:(NSString *)Id isFinished:(SingleSearchBlock)isFinished;//seach
+ (void)saveGzMessage:(GameMemo*)model isFinished:(OperatingBlock)isFinished;//save
+ (void)DeleteModel:(GameMemo*)model isFinished:(OperatingBlock)isFinished;//delete
+ (void)DeleteAllModelisFinished:(OperatingBlock)isFinished;//delete
+ (void)UpdateGzGameMemoModel:(GameMemo*)model isFinished:(OperatingBlock)isFinished;
+ (void)SearchModelisFinished:(AllSearchBlock)isFinished; //所有这个类的数据
+ (NSInteger)SearchModelCount;

@end

NS_ASSUME_NONNULL_END

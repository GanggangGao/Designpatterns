//
//  ConcurrentCommandManager.h
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//
/*
1. 问题：多线程当中存在同时缓存命令
2. 解决方案：队列
3. 定义一个并发管理器 ConcurrentCommandManager
 */

#import <Foundation/Foundation.h>
#import "DanPinRealization.h"
NS_ASSUME_NONNULL_BEGIN

@interface ConcurrentCommandManager : NSObject

-(instancetype)init:(DanPinRealization*)DanPin;

-(void)toOff;
-(void)setTime:(NSTimeInterval)Interval;
-(void)switchMode:(DanPinDetectionMode)Mode;
//回退上一个命令
- (void)Undo;
//回退所有的命令
- (void)UndoAll;
@end

NS_ASSUME_NONNULL_END

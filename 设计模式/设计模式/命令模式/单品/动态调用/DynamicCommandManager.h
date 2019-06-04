//
//  DynamicCommandManager.h
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

//流程

/*
1. 添加命令->调用了AddCommand: withObject:方法    ->DynamicCommandManager
2. 创建命令->CcreateCommand创建命令              ->DynamicCommandManager
     创建了一个block、其后withObject是命令的参数，并将其作为参数进行传递
3. 保存block、withObject参数->赋值给属性         ->DynamicCommand
4. 调用命令方法->toOff                         ->DynamicCommandManager
5. 执行命令->执行DynamicCommand的execute方法    ->DynamicCommand
6. 回调block
7. 执行2中创建的block代码块中的method的方法
 
iOS系统的命令模式  NSUndoManager 跟上述内容类似
 
具体的撤销逻辑由客户端自己决定->命令模式就是保存操作
*/

#import <Foundation/Foundation.h>
#import "DanPinRealization.h"
NS_ASSUME_NONNULL_BEGIN
//动态命令管理器
@interface DynamicCommandManager : NSObject

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

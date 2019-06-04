//
//  CompoundCommand.h
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

/*
 1. 新建一个复合命令 CompoundCommand
    实现DanPinCommandProtocol这个协议
 2. 新建一个复合命令管理器 CompoundCommandManager
 3. 以后看到
    CompoundCommand *Command = [[CompoundCommand alloc]init:self.commands];
    [Command execute];
    这种形式就是复合命令
 */




#import <Foundation/Foundation.h>
#import "DanPinCommandProtocol.h"
#import "DanPinRealization.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^DynamicBlock)(DanPinRealization *DanPin,id data);

@interface CompoundCommand : NSObject<DanPinCommandProtocol>

- (instancetype)init:(NSMutableArray *)Commands;

@end

NS_ASSUME_NONNULL_END

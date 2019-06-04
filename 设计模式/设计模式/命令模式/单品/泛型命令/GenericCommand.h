//
//  GenericCommand.h
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

/*
 1. 什么是泛型？
    在定义的时候不需要指定类型，在使用的时候指定类型
 2. 在OC、swift、java、中大量使用了泛型，比如说NSMutableArray swift中的Array中都是用了泛型
    C++称之为模版类，模版函数
 3. 学习泛型
    1）新建一个泛型类->泛型命令->GenericsCommand
            id是指向泛型的引用
    2) 新建一个命令管理类->泛型命令->GenericsCommandManager
 */

//接收者之前是写死的
#import <Foundation/Foundation.h>
#import "DanPinCommandProtocol.h"
NS_ASSUME_NONNULL_BEGIN
//T表示任意类型标记(标识符)
@interface GenericCommand<T,D> : NSObject<DanPinCommandProtocol>
@property(nonatomic,assign)id data;  //命令传递的参数
- (instancetype)init:(T)Receiver withObject:(D)data block:(void(^)(T,D))CommandBlock;

//提供一个创建命令类方法
+(id<DanPinCommandProtocol>)CreateCommand:(T)Receiver withObject:(D)data  block:(void(^)(T,D))CommandBlock ;

@end

NS_ASSUME_NONNULL_END

//
//  AggregrateProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/3.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IteratorProtocol.h"
NS_ASSUME_NONNULL_BEGIN

//简单工厂以及迭代器的结合
@protocol AggregrateProtocol <NSObject>

//添加
- (void)AddItem:(id)object;
//删除
- (void)removeItem:(NSInteger)index;
//获取迭代器迭代器
- (id<IteratorProtocol>)iterator;

@end

NS_ASSUME_NONNULL_END

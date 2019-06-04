//
//  ConcreteAggregrate.m
//  设计模式
//
//  Created by zachary spark on 2019/6/3.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ConcreteAggregrate.h"
#import "ConcreteIterator.h"
@interface ConcreteAggregrate()
{
    
    NSInteger _index;
    
}
@property (nonatomic,strong)NSMutableArray *ItemArray;

@end

@implementation ConcreteAggregrate


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ItemArray = [[NSMutableArray alloc]init];
    }
    return self;
}

//添加
- (void)AddItem:(id)object{
    [self.ItemArray addObject:object];
}
//删除
- (void)removeItem:(NSInteger)index{
    return [self.ItemArray removeObjectAtIndex:index];
}


//获取迭代器迭代器
- (id<IteratorProtocol>)iterator{
    return [[ConcreteIterator alloc]initWithArray:self.ItemArray];
}


@end

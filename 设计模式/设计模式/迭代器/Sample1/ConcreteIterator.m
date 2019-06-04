//
//  ConcreteIterator.m
//  设计模式
//
//  Created by zachary spark on 2019/6/3.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ConcreteIterator.h"


@interface ConcreteIterator()
{
    
    NSInteger _index;
    
}
@property (nonatomic,strong)NSMutableArray *ItemArray;

@end

@implementation ConcreteIterator



- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _index = 0;
        _ItemArray = [[NSMutableArray alloc]initWithArray:array];
    }
    return self;
}


- (id)next{
    
    if([self hasNext]){
        
        id item = [_ItemArray objectAtIndex:_index];
        _index += 1;
        return item;
    }
    return nil;
    
}

- (BOOL)hasNext{
    return _index != _ItemArray.count;
}


@end

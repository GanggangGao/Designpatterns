//
//  Composite.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "Composite.h"

@interface Composite()

@end


@implementation Composite

@synthesize name;

@synthesize components;

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.components = [[NSMutableArray alloc]init];
    }
    return self;
}


- (void)addChild:(id<ComponentProtocol>)Child {
    [self.components addObject:Child];
}

- (void)clear {
    [self.components removeAllObjects];
}

- (void)doSomthing {
    NSLog(@"节点名称:%@",self.name);
}

- (id<ComponentProtocol>)getChild:(NSInteger)Index {
    return [self.components objectAtIndex:Index];
}

- (void)removeChild:(id<ComponentProtocol>)Child {
    [self.components removeObject:Child];
}





@end

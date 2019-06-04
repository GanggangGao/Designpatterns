//
//  leaf.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "leaf.h"

@implementation leaf

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
    NSLog(@"叶子节点没有子节点...");
}

- (void)clear {
    NSLog(@"叶子节点没有子节点...");
}

- (void)doSomthing {
    NSLog(@"节点名称:%@",self.name);
}

- (id<ComponentProtocol>)getChild:(NSInteger)Index {
    NSLog(@"叶子节点没有子节点...");
    return nil;
}

- (void)removeChild:(id<ComponentProtocol>)Child {
     NSLog(@"叶子节点没有子节点...");
}

@end

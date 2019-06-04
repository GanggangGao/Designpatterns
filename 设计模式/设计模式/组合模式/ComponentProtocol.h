//
//  ComponentProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ComponentProtocol <NSObject>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSMutableArray *components;

- (void)doSomthing;
- (void)addChild:(id<ComponentProtocol>)Child;
- (void)removeChild:(id<ComponentProtocol>)Child;
- (id<ComponentProtocol>)getChild:(NSInteger)Index;
- (void)clear;

@end

//
//  ShoppingDynamicCommand.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ShoppingDynamicCommand.h"
@interface ShoppingDynamicCommand()
@property(nonatomic,strong)ShoppingReceiver *Commodity;
@property(nonatomic,copy)DynamicBlock block;
@property(nonatomic,assign)id data;  //命令传递的参数
@end
@implementation ShoppingDynamicCommand


- (instancetype)init:(ShoppingReceiver *)Commodity withObject:(id)data block:(DynamicBlock)block {
    
    self = [super init];
    if(self){
        self.data = data;
        self.Commodity = Commodity;
        self.block = block;
    }
    return self;
    
    
}

- (void)execute{
    self.block(self.Commodity,self.data);
}

//创建对象的时候 由于有时候初始化参数的过于复杂，所以我们可以内部提供
//动态命令创建过程，专门有了实现，外部只需要调用即可
+(id<ShoppingCommandProtocol>)CreateCommand:(ShoppingReceiver *)Commodity withObject:(id)data block:(DynamicBlock)block {
    
    return [[ShoppingDynamicCommand alloc]init:Commodity withObject:data  block:block];
    
}
@end

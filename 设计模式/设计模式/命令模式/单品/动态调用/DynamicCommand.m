//
//  DynamicCommand.m
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DynamicCommand.h"

@interface DynamicCommand()
@property(nonatomic,strong)DanPinRealization *Danpin;
@property(nonatomic,copy)DynamicBlock DanPinBlock;

@end

@implementation DynamicCommand


- (instancetype)init:(DanPinRealization *)Danpin withObject:(id)data block:(DynamicBlock)DanPinBlock {
    
    self = [super init];
    if(self){
        self.data = data;
        self.Danpin = Danpin;
        self.DanPinBlock = DanPinBlock;
    }
    return self;
    
    
}

- (void)execute{
    self.DanPinBlock(self.Danpin,self.data);
}

//创建对象的时候 由于有时候初始化参数的过于复杂，所以我们可以内部提供
//动态命令创建过程，专门有了实现，外部只需要调用即可
+(id<DanPinCommandProtocol>)CreateCommand:(DanPinRealization *)DanPin withObject:(id)data block:(DynamicBlock)DanPinBlock {
    
    return [[DynamicCommand alloc]init:DanPin withObject:data  block:DanPinBlock];
    
}


@end

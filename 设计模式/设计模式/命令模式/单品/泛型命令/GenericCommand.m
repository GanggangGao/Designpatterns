//
//  GenericCommand.m
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GenericCommand.h"

@interface GenericCommand<T,D>()
@property(nonatomic,strong)T Receiver;
@property(nonatomic,copy)void(^CommandBlock)(T,D);

@end

@implementation GenericCommand


- (instancetype)init:(id)Receiver withObject:(id)data block:(void(^)(id,id))CommandBlock{
    
    self = [super init];
    if(self){
        self.data = data;
        self.Receiver = Receiver;
        self.CommandBlock = CommandBlock;
    }
    return self;
    
}


- (void)execute{
    self.CommandBlock(self.Receiver, self.data);
}


+(id<DanPinCommandProtocol>)CreateCommand:(id)Receiver withObject:(id)data  block:(void(^)(id,id))CommandBlock {
    
    return [[GenericCommand alloc]init:Receiver withObject:data block:CommandBlock];
}


@end

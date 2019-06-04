//
//  ConcurrentCommandManager.m
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ConcurrentCommandManager.h"
#import "GenericCommand.h"
#import "CompoundCommand.h"
@interface ConcurrentCommandManager()
@property(nonatomic,strong)NSMutableArray *commands;
@property(nonatomic,strong)DanPinRealization *DanPin;
@property(nonatomic,strong)dispatch_queue_t queue;
@end
@implementation ConcurrentCommandManager
-(instancetype)init:(DanPinRealization*)DanPin{
    
    self = [super init];
    if(self){
        self.DanPin = DanPin;
        self.commands = [[NSMutableArray alloc]init];
        self.queue = dispatch_queue_create("Command", NULL);
    }
    return self;
    
}


- (void)AddCommand:(NSString *)MethodName withObject:(id)data{
    
    //线程安全
    //多线程处理->异步
//    __block typeof(self)blcokself = self;
    dispatch_sync(self.queue, ^{
        //获取到方法对象
        SEL Method = NSSelectorFromString(MethodName);
        //添加动态命令
        [self.commands addObject:[GenericCommand CreateCommand:self.DanPin withObject:data block:^(DanPinRealization *DanPin,id data) {
            //执行回调
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.DanPin performSelector:Method withObject:data];
#pragma clang diagnostic pop
        } ]];
    });
    
}

-(void)toOff{
    
    [self AddCommand:@"ProductSwitchOff" withObject:[NSNull null]];
    [self.DanPin ProductSwitchOff];
}

-(void)setTime:(NSTimeInterval)Interval{
    [self AddCommand:@"ProductSetTime:" withObject:[NSNumber numberWithDouble:Interval]];
    [self.DanPin ProductSetTime:Interval];
}

-(void)switchMode:(DanPinDetectionMode)Mode{
    [self AddCommand:@"ProductDetectionMode:" withObject:[NSNumber numberWithInt:Mode]];
    [self.DanPin ProductDetectionMode:DanPinDetectionModeInterval];
}
//回退上一个命令
- (void)Undo{
    if(self.commands.count > 0){
        
        [[self.commands lastObject] execute];
        [self.commands removeLastObject];
    }
}
//回退所有的命令
- (void)UndoAll{
    
    //普通命令
    //
    //    for (id<DanPinCommandProtocol> Command in self.commands) {
    //        [Command execute];
    //    }
    //
    
    //复合命令
    CompoundCommand *Command = [[CompoundCommand alloc]init:self.commands];
    [Command execute];
    [self.commands removeAllObjects];
    
}
@end

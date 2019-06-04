//
//  BlockCommandManager.m
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BlockCommandManager.h"
#import "GenericCommand.h"
#import "CompoundCommand.h"

typedef void(^BlockCommand)(DanPinRealization *DanPin,id data);

@interface BlockCommandManager()
@property(nonatomic,strong)NSMutableArray *commands;
@property(nonatomic,strong)NSMutableArray *datas;
@property(nonatomic,strong)DanPinRealization *DanPin;
@property(nonatomic,strong)dispatch_queue_t queue;
@end
@implementation BlockCommandManager
-(instancetype)init:(DanPinRealization*)DanPin{
    
    self = [super init];
    if(self){
        self.DanPin = DanPin;
        self.commands = [[NSMutableArray alloc]init];
        self.datas = [[NSMutableArray alloc]init];
        self.queue = dispatch_queue_create("Command", NULL);
    }
    return self;
    
}


- (void)AddCommand:(NSString *)MethodName withObject:(id)data{
    
    //线程安全
    //多线程处理->异步
    dispatch_sync(self.queue, ^{
        //获取到方法对象
        SEL Method = NSSelectorFromString(MethodName);
        //添加动态命令(保存的是block)
        [self.commands addObject:^(DanPinRealization *DanPin,id data){
            
            //执行回调
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [DanPin performSelector:Method withObject:data];
            #pragma clang diagnostic pop
            
        }];
    });
    
}

-(void)toOff{
    
    [self AddCommand:@"ProductSwitchOff" withObject:nil];
    [self.datas addObject:[NSNull null]];
    [self.DanPin ProductSwitchOff];
}

-(void)setTime:(NSTimeInterval)Interval{
    [self AddCommand:@"ProductSetTime:" withObject:[NSNumber numberWithDouble:Interval]];
    [self.datas addObject:[NSNumber numberWithDouble:Interval]];
    [self.DanPin ProductSetTime:Interval];
}

-(void)switchMode:(DanPinDetectionMode)Mode{
    [self AddCommand:@"ProductDetectionMode:" withObject:[NSNumber numberWithInt:Mode]];
    [self.datas addObject:[NSNumber numberWithInteger:Mode]];
    [self.DanPin ProductDetectionMode:Mode];
}
//回退上一个命令
- (void)Undo{
    if(self.commands.count > 0){
        
        BlockCommand command =[self.commands lastObject];
        command(self.DanPin,[self.datas lastObject]);
        [self.commands removeLastObject];
        [self.datas removeLastObject];
    }
}
//回退所有的命令
- (void)UndoAll{
    
    for (int i = 0; i<self.commands.count; i++) {
        BlockCommand Command = [self.commands objectAtIndex:i];
        id data = [self.datas objectAtIndex:i];
        Command(self.DanPin,data);
    }
    [self.datas removeAllObjects];
    [self.commands removeAllObjects];
    
}
@end

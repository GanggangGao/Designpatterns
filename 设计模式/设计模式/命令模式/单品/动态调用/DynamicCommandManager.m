//
//  DynamicCommandManager.m
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DynamicCommandManager.h"
#import "DynamicCommand.h"
@interface DynamicCommandManager()
@property(nonatomic,strong)NSMutableArray *commands;
@property(nonatomic,strong)DanPinRealization *DanPin;
@end


@implementation DynamicCommandManager
-(instancetype)init:(DanPinRealization*)DanPin{
    
    self = [super init];
    if(self){
        self.DanPin = DanPin;
        self.commands = [[NSMutableArray alloc]init];
    }
    return self;
    
}


- (void)AddCommand:(NSString *)MethodName withObject:(id)data{
    
    //获取到方法对象
    SEL Method = NSSelectorFromString(MethodName);
    [self.commands addObject:[DynamicCommand CreateCommand:self.DanPin withObject:data block:^(DanPinRealization *DanPin,id data) {
        //执行回调
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.DanPin performSelector:Method withObject:data];
        #pragma clang diagnostic pop
    } ]];
    
    
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
    
    for (id<DanPinCommandProtocol> Command in self.commands) {
        [Command execute];
    }
    
    [self.commands removeAllObjects];

}


@end

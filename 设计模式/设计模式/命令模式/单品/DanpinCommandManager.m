//
//  DanpinCommandManager.m
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DanpinCommandManager.h"

@interface DanpinCommandManager()
@property(nonatomic,strong)NSMutableArray *commands;
@property(nonatomic,strong)DanPinSwitchCommand *OffCommand;
@property(nonatomic,strong)DanPinSetTimeCommand *SetTimeCommand;
@property(nonatomic,strong)DanPinSwitchModeCommand *SwitchModeCommand;

@end

@implementation DanpinCommandManager



-(instancetype)initSwitch:(DanPinSwitchCommand*)Off SetTime:(DanPinSetTimeCommand*)SetTime SwitchMode:(DanPinSwitchModeCommand*)SwitchMode{
    
    self = [super init];
    if(self){
        self.commands = [[NSMutableArray alloc]init];
        self.OffCommand = Off;
        self.SetTimeCommand = SetTime;
        self.SwitchModeCommand = SwitchMode;
    }
    return self;
}

-(void)toOff{
    [self.OffCommand execute];
    [self.commands addObject:self.OffCommand];
}

-(void)setTime:(NSTimeInterval)Interval{
    self.SetTimeCommand.interval = Interval;
    [self.SetTimeCommand execute];
    [self.commands addObject:self.SetTimeCommand];
}

-(void)switchMode:(DanPinDetectionMode)Mode{
    self.SwitchModeCommand.Mode = Mode;
    [self.SwitchModeCommand execute];
    [self.commands addObject:self.SwitchModeCommand];
}

//回退上一个命令
- (void)Undo{
    
    [[self.commands lastObject] execute];
    [self.commands removeLastObject];
    
}
//回退所有的命令
- (void)UndoAll{
    for (id<DanPinCommandProtocol> commad in self.commands) {
        [commad execute];
    }
    [self.commands removeAllObjects];
}


@end





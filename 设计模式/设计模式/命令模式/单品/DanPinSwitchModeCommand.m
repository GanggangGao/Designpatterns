//
//  DanPinSwitchModeCommand.m
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DanPinSwitchModeCommand.h"
@interface DanPinSwitchModeCommand()
@property(nonatomic,strong)DanPinRealization *DanPin;
@end
@implementation DanPinSwitchModeCommand

- (instancetype)init:(DanPinRealization *)DanPin{
    
    self = [super init];
    if(self){
        self.DanPin = DanPin;
    }
    return self;
    
}

- (void)execute{
    [self.DanPin ProductDetectionMode:self.Mode];
}

@end

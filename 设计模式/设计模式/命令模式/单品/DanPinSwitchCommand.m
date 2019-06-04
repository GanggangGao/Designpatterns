//
//  DanPinSwitchCommand.m
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DanPinSwitchCommand.h"

@interface DanPinSwitchCommand()
@property(nonatomic,strong)DanPinRealization *DanPin;
@end

@implementation DanPinSwitchCommand

- (instancetype)init:(DanPinRealization *)DanPin{
    
    self = [super init];
    if(self){
        self.DanPin = DanPin;
    }
    return self;
    
}

- (void)execute{
    [self.DanPin ProductSwitchOff];
}

@end

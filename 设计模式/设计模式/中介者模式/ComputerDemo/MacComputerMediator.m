//
//  MacComputerMediator.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MacComputerMediator.h"

@implementation MacComputerMediator


- (void)changedColleague:(ComputerColleague *)colleague {
    if([colleague isEqual:self.cpu]){
        [self handle:self.cpu];
    }else if([colleague isEqual:self.cddevice]){
        [self handler:self.cddevice];
    }
}


- (void)handler:(ComputerCDDevice *)cddevice{
    
    [self.cpu deCodeData:[cddevice read]];
    
}


- (void)handle:(ComputerCPU *)cpu{
    [self.soundcard soundPlayData:[cpu getSoundData]];
    [self.displaycard videoPlayData:[cpu getVideoData]];
}

- (void)dealloc{
    
    
    
    NSLog(@"%@释放了",NSStringFromClass(self.class));
    
}


@end

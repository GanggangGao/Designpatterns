//
//  ComputerCDDevice.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ComputerCDDevice.h"

@interface ComputerCDDevice()
{
    NSString *data;
}
@end

@implementation ComputerCDDevice

- (instancetype)initWithMediator:(id<ComputerMediator>)Mediator{
    
    self = [super initWithMediator:Mediator];
    if(self){
        self.Mediator = Mediator;
    }
    return self;
}


- (NSString *)read{
    
    return data;
    
}


- (void)load{
    data = @"视频数据,音频数据";
    [self.Mediator changedColleague:self];
}





@end

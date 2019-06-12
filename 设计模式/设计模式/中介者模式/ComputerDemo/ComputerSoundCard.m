//
//  ComputerSoundCard.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ComputerSoundCard.h"

@implementation ComputerSoundCard

- (instancetype)initWithMediator:(id<ComputerMediator>)Mediator{
    
    self = [super initWithMediator:Mediator];
    if(self){
        self.Mediator = Mediator;
    }
    return self;
}


- (void)soundPlayData:(NSString *)data{
    NSLog(@"%@",data);
}

@end

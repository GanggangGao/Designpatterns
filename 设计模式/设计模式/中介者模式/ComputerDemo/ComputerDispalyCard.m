//
//  ComputerDispalyCard.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ComputerDispalyCard.h"

@implementation ComputerDispalyCard

- (instancetype)initWithMediator:(id<ComputerMediator>)Mediator{
    
    self = [super initWithMediator:Mediator];
    if(self){
        self.Mediator = Mediator;
    }
    return self;
}


- (void)videoPlayData:(NSString *)data{
    NSLog(@"播放视频");
}


@end

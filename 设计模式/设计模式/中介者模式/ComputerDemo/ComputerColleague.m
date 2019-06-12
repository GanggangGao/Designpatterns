//
//  ComputerColleague.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ComputerColleague.h"

@implementation ComputerColleague

- (instancetype)initWithMediator:(id<ComputerMediator>)Mediator
{
    self = [super init];
    if (self) {
        self.Mediator = Mediator;
    }
    return self;
}

- (void)dealloc{
    
    
    
    NSLog(@"%@释放了",NSStringFromClass(self.class));
    
}


@end

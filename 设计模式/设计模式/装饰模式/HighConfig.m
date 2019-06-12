//
//  HighConfig.m
//  设计模式
//
//  Created by zachary spark on 2019/6/12.
//  Copyright © 2019 3g. All rights reserved.
//

#import "HighConfig.h"
#import "BMWCar.h"

@implementation HighConfig
@synthesize car;

- (instancetype)initWithCar:(BMWCar *)car
{
    self = [super init];
    if (self) {
        self.car = car;
    }
    return self;
}


- (void)AddConfiguration{
    
    NSLog(@"选购车型：%@",[self.car CarName]);
    NSLog(@"宝马配置：2019款 M760Li xDrive V12 运动套装 价格 242.8万元");
    
}




@end

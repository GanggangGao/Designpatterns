//
//  BMWCar.m
//  设计模式
//
//  Created by zachary spark on 2019/6/12.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BMWCar.h"

@implementation BMWCar

- (NSString *)CarName{
    return @"宝马7系";
}

- (void)Configuration{
    
    NSLog(@"选购车型：%@",[self CarName]);
    NSLog(@"宝马配置：裸车没有选择配置");
    
}


@end

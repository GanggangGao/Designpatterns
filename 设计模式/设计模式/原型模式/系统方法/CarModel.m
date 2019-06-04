//
//  CarModel.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel



- (instancetype)initWithName:(NSString *)name des:(NSString *)des
{
    self = [super init];
    if (self) {
        self.Nmae = name;
        self.Des = des;
    }
    return self;
}


- (id)copyWithZone:(nullable NSZone *)zone{
    
    return [[CarModel alloc]initWithName:self.Nmae des:self.Des];
    
}


@end



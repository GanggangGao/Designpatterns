//
//  CarModel2.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "CarModel2.h"

@implementation CarModel2

- (instancetype)initWithName:(NSString *)name des:(NSString *)des Number:(LicensePlateNumber *)number
{
    self = [super init];
    if (self) {
        self.Nmae = name;
        self.Des = des;
        self.Number = number;
    }
    return self;
}




- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return [[CarModel2 alloc]initWithName:self.Nmae des:self.Des Number:[self.Number copy]];
}

@end

//
//  CarModel1.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "CarModel1.h"

@implementation CarModel1


- (instancetype)initWithName:(NSString *)name des:(NSString *)des
{
    self = [super init];
    if (self) {
        self.Nmae = name;
        self.Des = des;
    }
    return self;
}


- (id)Clone{
    
    return [[CarModel1 alloc]initWithName:self.Nmae des:self.Des];
    
}



@end

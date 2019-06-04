//
//  ObjectMoneyAdapter.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ObjectMoneyAdapter.h"


@interface  ObjectMoneyAdapter()
@property(nonatomic,strong)MoneyAdaptee *adaptee;
@end

@implementation ObjectMoneyAdapter


- (instancetype)init:(MoneyAdaptee *)adaptee
{
    self = [super init];
    if (self) {
        self.adaptee = adaptee;
    }
    return self;
}

- (float)getRMB {
    return [self.adaptee getUSA] * 6.5;
}

@end

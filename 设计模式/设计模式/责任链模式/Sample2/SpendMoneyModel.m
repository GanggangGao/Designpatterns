//
//  SpendMenoryModel.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "SpendMoneyModel.h"

@implementation SpendMoneyModel

- (instancetype)initWithMoney:(CGFloat)money things:(NSString*)things role:(NSString*)role
{
    self = [super init];
    if (self) {
        self.money = money;
        self.things = things;
        self.role = role;
    }
    return self;
}

@end

//
//  MoneyAdapter.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MoneyAdapter.h"

@implementation MoneyAdapter

- (float)getRMB{
    
    return [self getUSA]*6.5;
}


@end

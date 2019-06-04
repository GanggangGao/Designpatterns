//
//  TrainTicket.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TrainTicket.h"

@implementation TrainTicket

- (instancetype)initWithFrom:(NSString *)from to:(NSString *)to
{
    self = [super init];
    if (self) {
        self.from = from;
        self.to = to;
    }
    return self;
}

- (void)showTicketInfo:(NSString *)bunk{
    
    self.bunk = bunk;
    //这个逻辑需要查询数据库，根据起点位置和终点位置查询
    //写死了
    if ([bunk isEqualToString:@"二等座"]) {
        self.price = 880;
    } else if ([bunk isEqualToString:@"一等座"]) {
        self.price = 1200;
    } else if ([bunk isEqualToString:@"特等座"]) {
        self.price = 1500;
    } else if ([bunk isEqualToString:@"商务座"]) {
        self.price = 1800;
    }
    
    NSLog(@"from = %@，to = %@，bunk = %@， price = %ld",self.from,self.to,self.bunk,self.price);
    
}


@end

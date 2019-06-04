//
//  TicketFactory.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TicketFactory.h"



static NSMutableDictionary * dict;

@interface TicketFactory()


@end

@implementation TicketFactory

+ (id<TrainTicketProtocol>)Ticketfrom:(NSString *)from to:(NSString *)to{
    
    NSString *key = [NSString stringWithFormat:@"%@_%@",from,to];
    if(![dict objectForKey:@"key"]){
        id<TrainTicketProtocol> ticket = [[TrainTicket alloc]initWithFrom:from to:to];
        [dict setValue:ticket forKey:key];
        return ticket;
    }
    
    return [dict objectForKey:@"key"];
}

+ (void)Clean
{
    [dict removeAllObjects];
    dict = nil;
}



@end

//
//  TicketFactory.h
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TrainTicket.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketFactory : NSObject
+ (id<TrainTicketProtocol>)Ticketfrom:(NSString *)from to:(NSString *)to;
+ (void)Clean;
@end

NS_ASSUME_NONNULL_END

//
//  TrainTicket.h
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrainTicketProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface TrainTicket : NSObject<TrainTicketProtocol>

@property (nonatomic,assign) NSInteger price; //价格
@property (nonatomic,copy) NSString * from;  //从哪里出发
@property (nonatomic,copy) NSString * to;    //要到哪里
@property (nonatomic,copy) NSString * bunk;  //座位
- (instancetype)initWithFrom:(NSString *)from to:(NSString *)to;

@end

NS_ASSUME_NONNULL_END

//
//  GGContreteObserver.m
//  设计模式
//
//  Created by zachary spark on 2019/5/28.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GGContreteObserver.h"

@implementation GGContreteObserver

- (void)GGObserverisChanged {
    
    NSLog(@"发送了通知");
}

- (void)GGObserverisChanged:(id<GGobservableProtocol>)servable msg:(NSString *)msg {
     NSLog(@"%@  --> 发送了通知 消息是 --> %@",servable,msg);
}

@end

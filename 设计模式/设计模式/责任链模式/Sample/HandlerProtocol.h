//
//  HandlerProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HandlerProtocol <NSObject>

@property (nonatomic, strong) id<HandlerProtocol> nextHandler;

- (void)HandlerConditionlevel:(NSInteger)level;

- (NSInteger)getLevel;



@end

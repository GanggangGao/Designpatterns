//
//  ComputerColleague.h
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComputerMediator.h"

@protocol  ComputerMediator;

NS_ASSUME_NONNULL_BEGIN
@interface ComputerColleague : NSObject
@property (nonatomic,weak)id<ComputerMediator> Mediator;
- (instancetype)initWithMediator:(id<ComputerMediator>)Mediator;
@end

NS_ASSUME_NONNULL_END

//
//  CarConfigProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/12.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMWCar.h"


//角色三：抽象装饰
NS_ASSUME_NONNULL_BEGIN

@protocol CarConfigProtocol <NSObject>

@property (nonatomic,strong) BMWCar *car;
- (instancetype)initWithCar:(BMWCar *)car;
- (void)AddConfiguration;

@end

NS_ASSUME_NONNULL_END

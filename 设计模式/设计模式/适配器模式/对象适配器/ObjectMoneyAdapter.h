//
//  ObjectMoneyAdapter.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoneyTarget.h"
#import "MoneyAdaptee.h"
NS_ASSUME_NONNULL_BEGIN


//两个特点
//特点一：实现协议
//特点二： 持有被适配者的引用

@interface ObjectMoneyAdapter : NSObject<MoneyTarget>
- (instancetype)init:(MoneyAdaptee *)adaptee;
@end

NS_ASSUME_NONNULL_END

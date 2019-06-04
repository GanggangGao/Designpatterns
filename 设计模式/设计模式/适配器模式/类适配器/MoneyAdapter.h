//
//  MoneyAdapter.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoneyTarget.h"
#import "MoneyAdaptee.h"
NS_ASSUME_NONNULL_BEGIN

//适配器:MoneyAdapter
//特点一：实现协议
//特点二：适配器继承被适配者

@interface MoneyAdapter : MoneyAdaptee<MoneyTarget>

@end

NS_ASSUME_NONNULL_END

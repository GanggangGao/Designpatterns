//
//  LiCai.h
//  设计模式
//
//  Created by zachary spark on 2019/5/20.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//抽象的策略接口协议
@protocol Licai <NSObject>

- (int)licaiwithMoth:(int)month money:(float)money;

@end

NS_ASSUME_NONNULL_END

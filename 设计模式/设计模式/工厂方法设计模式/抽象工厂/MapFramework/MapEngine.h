//
//  MapEngine.h
//  设计模式
//
//  Created by zachary spark on 2019/5/16.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapFactoryProtocol.h"

NS_ASSUME_NONNULL_BEGIN

//地图引擎创建谁?->工厂标准我们是知道的
//简单工厂
@interface MapEngine : NSObject
-(id<MapFactoryProtocol>)getFactory;
@end

NS_ASSUME_NONNULL_END

//
//  CarProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/12.
//  Copyright © 2019 3g. All rights reserved.
//

// 角色一：抽象组件

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CarProtocol <NSObject>

- (NSString *)CarName;
- (void)Configuration;
@end

NS_ASSUME_NONNULL_END

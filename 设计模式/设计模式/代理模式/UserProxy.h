//
//  UserProxy.h
//  设计模式
//
//  Created by zachary spark on 2019/6/12.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserProtocol.h"


//代理对象
NS_ASSUME_NONNULL_BEGIN

@interface UserProxy : NSObject<UserProtocol>
- (instancetype)initWithUser:(id<UserProtocol>)user;
@end

NS_ASSUME_NONNULL_END

//
//  Composite.h
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ComponentProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Composite : NSObject<ComponentProtocol>
- (instancetype)initWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END

//
//  ConcreteIterator.h
//  设计模式
//
//  Created by zachary spark on 2019/6/3.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IteratorProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface ConcreteIterator : NSObject<IteratorProtocol>
- (instancetype)initWithArray:(NSArray *)array;
@end

NS_ASSUME_NONNULL_END

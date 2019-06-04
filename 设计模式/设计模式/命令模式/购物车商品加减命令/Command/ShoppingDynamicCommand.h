//
//  ShoppingDynamicCommand.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingCommandProtocol.h"
#import "ShoppingReceiver.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^DynamicBlock)(ShoppingReceiver *Commodity,id data);


@interface ShoppingDynamicCommand : NSObject<ShoppingCommandProtocol>

- (instancetype)init:(ShoppingReceiver *)Commodity withObject:(id)data block:(DynamicBlock)block;

+(id<ShoppingCommandProtocol>)CreateCommand:(ShoppingReceiver *)Commodity withObject:(id)data  block:(DynamicBlock)block ;
@end

NS_ASSUME_NONNULL_END

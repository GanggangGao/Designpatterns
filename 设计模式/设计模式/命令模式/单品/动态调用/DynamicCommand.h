//
//  DynamicCommand.h
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DanPinCommandProtocol.h"
#import "DanPinRealization.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^DynamicBlock)(DanPinRealization *DanPin,id data);

//特点：实现命令协议

@interface DynamicCommand : NSObject<DanPinCommandProtocol>

//这个id类型是一个参数，如果在使用命令得到时候需要多个参数，或者更复杂的参数，你只需要将id换成一个固定的CusModel，使用的时候加上一个Type来表示是谁的参数，不同类型，在这个CusModel中使用你所需要的CusModel1
@property(nonatomic,assign)id data;  //命令传递的参数


- (instancetype)init:(DanPinRealization *)Danpin withObject:(id)data block:(DynamicBlock)DanPinBlock;

+(id<DanPinCommandProtocol>)CreateCommand:(DanPinRealization *)DanPin withObject:(id)data  block:(DynamicBlock)DanPinBlock ;
@end

NS_ASSUME_NONNULL_END

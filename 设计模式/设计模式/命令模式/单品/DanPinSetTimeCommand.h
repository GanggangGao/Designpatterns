//
//  DanPinSettimeCommand.h
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DanPinCommandProtocol.h"
#import "DanPinRealization.h"
NS_ASSUME_NONNULL_BEGIN
//设置单品检测间隔时间的命令对象
@interface DanPinSetTimeCommand : NSObject<DanPinCommandProtocol>

@property(nonatomic,assign)NSTimeInterval interval;

- (instancetype)init:(DanPinRealization *)DanPin;

@end

NS_ASSUME_NONNULL_END

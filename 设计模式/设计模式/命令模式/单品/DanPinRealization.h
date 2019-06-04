//
//  DanPinRealization.h
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

//NS_OPTIONS
typedef NS_ENUM(NSUInteger, DanPinDetectionMode) {
    DanPinDetectionModeInterval,
    DanPinDetectionModeContinuous,
    DanPinDetectionModeNone,
};

//单品的实现类，所有的命令操作，都要有一个具体的接收者，也就是单品本身来进行命令的处理，也就是执行命令的一个实体。
@interface DanPinRealization : NSObject



- (void)ProductSwitchOff;
- (void)ProductSetTime:(NSTimeInterval)time;
- (void)ProductDetectionMode:(DanPinDetectionMode)mode;

@end

NS_ASSUME_NONNULL_END

//
//  DanPinRealization.m
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DanPinRealization.h"

@implementation DanPinRealization

- (void)ProductSwitchOff{
    NSLog(@"关机命令执行");
}
//设置间隔模式检测间隔时间，如果不设置默认时间是10秒
- (void)ProductSetTime:(NSTimeInterval)time{
    NSLog(@"设置间隔时间");
}
- (void)ProductDetectionMode:(DanPinDetectionMode)mode{
    NSLog(@"设置检测模式");
}
@end

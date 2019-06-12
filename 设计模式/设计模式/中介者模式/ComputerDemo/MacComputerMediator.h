//
//  MacComputerMediator.h
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComputerMediator.h"
#import "ComputerCPU.h"
#import "ComputerDispalyCard.h"
#import "ComputerSoundCard.h"
#import "ComputerCDDevice.h"
NS_ASSUME_NONNULL_BEGIN

@interface MacComputerMediator : NSObject<ComputerMediator>
@property (nonatomic,strong)ComputerCPU * cpu;
@property (nonatomic,strong)ComputerDispalyCard * displaycard;
@property (nonatomic,strong)ComputerSoundCard * soundcard;
@property (nonatomic,strong)ComputerCDDevice * cddevice;

@end

NS_ASSUME_NONNULL_END

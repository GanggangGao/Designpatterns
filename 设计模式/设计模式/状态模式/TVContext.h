//
//  TVContext.h
//  设计模式
//
//  Created by zachary spark on 2019/6/6.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TVContext : NSObject<StateProtocol>

- (void)powerOff;
- (void)powerOn;

@end

NS_ASSUME_NONNULL_END

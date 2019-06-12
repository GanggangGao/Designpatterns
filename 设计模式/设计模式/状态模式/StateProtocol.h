//
//  StateProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/6.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StateProtocol <NSObject>

- (void)nextChannel;
- (void)preChannel;
- (void)turnUp;
- (void)turnDown;

@end


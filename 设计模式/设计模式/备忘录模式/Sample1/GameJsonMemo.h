//
//  GameJsonMemo.h
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@class GameJsonOriginator;

@interface GameJsonMemo : NSObject

- (instancetype)initWithOriginator:(GameJsonOriginator *)Originator;
- (void)Restore:(GameJsonOriginator *)Originator;
@end

NS_ASSUME_NONNULL_END

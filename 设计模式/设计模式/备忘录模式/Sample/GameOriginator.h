//
//  GameOriginator.h
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameMemo.h"
NS_ASSUME_NONNULL_BEGIN

@interface GameOriginator : NSObject
@property (nonatomic,assign) NSInteger point;
@property (nonatomic,assign) NSInteger level;
- (void)PlayAndSuccess;
- (void)exitGame;
- (void)RestoreGameWithMemo:(GameMemo *)memo;
- (void)ShowInfoCurrentGame;
- (GameMemo*)CreateMemo;


@end

NS_ASSUME_NONNULL_END

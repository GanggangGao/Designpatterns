//
//  GameJsonOriginator.h
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonModel.h"
#import "GameJsonMemo.h"
NS_ASSUME_NONNULL_BEGIN

@interface GameJsonOriginator : NSObject

@property (nonatomic,strong) NSMutableArray<JsonModel *> *GameJsons;

@property (nonatomic,assign) NSInteger total;

@property (nonatomic,copy) NSString *CurrentId;

- (void)addGameResultsWithPoint:(NSInteger)point level:(NSInteger)level;

- (GameJsonMemo *)CreateGameMemo;
- (void)RestoreMoment:(GameJsonMemo *)Memo;
- (void)ShowCurrentTotalPoint;
@end

NS_ASSUME_NONNULL_END

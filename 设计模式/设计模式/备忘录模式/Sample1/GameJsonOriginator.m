//
//  GameJsonOriginator.m
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GameJsonOriginator.h"

@interface  GameJsonOriginator()

@end

@implementation GameJsonOriginator


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.GameJsons = [[NSMutableArray alloc]init];
        self.total = 0;
    }
    return self;
}


- (void)addGameResultsWithPoint:(NSInteger)point level:(NSInteger)level{
    
    JsonModel *json = [[JsonModel alloc]init];
    json.point = point;
    json.level = level;
    self.total += point;
    [self.GameJsons addObject:json];
    
}


- (GameJsonMemo *)CreateGameMemo{
    
    return [[GameJsonMemo alloc]initWithOriginator:self];
    
}

- (void)RestoreMoment:(GameJsonMemo *)Memo{
    [Memo Restore:self];
}



- (void)ShowCurrentTotalPoint{
    
    NSLog(@"总得分 == %ld",self.total);
    
    
}



@end

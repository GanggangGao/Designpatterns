//
//  GameOriginator.m
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GameOriginator.h"
#import "GameCaretaker.h"
@implementation GameOriginator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.point = 0;
        self.level = 0;
    }
    return self;
}

- (void)PlayAndSuccess{
    
    printf("游戏开始了，当前进度是第%ld，目前的了%ld分...",self.level,self.point);
    self.level += 1;
    self.point += 50;
    printf("恭喜你升了一级...");
    printf("恭喜你积分增加了50分...");
    printf("当前等级是第%ld级，目前得到了%ld分...",self.level,self.point);
    
}

- (void)exitGame{
    
    printf("-----游戏结束-----");
    printf("-----退出游戏，当前等级是%ld-----",self.level);
    printf("-----游戏结束-----");
}


- (void)RestoreGameWithMemo:(GameMemo *)memo{
    printf("-----恢复游戏-----");
    self.point = memo.point;
    self.level = memo.level;
    printf("当前等级是第%ld级，目前得到了%ld分...",self.level,self.point);
    
}

- (void)ShowInfoCurrentGame{
    
    printf("当前等级是第%ld级，目前得到了%ld分...",self.level,self.point);
    
}



- (GameMemo*)CreateMemo
{
    return [[GameMemo alloc]initWithPoint:self.point level:self.level];
}


@end

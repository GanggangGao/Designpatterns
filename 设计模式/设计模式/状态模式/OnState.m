//
//  OnState.m
//  设计模式
//
//  Created by zachary spark on 2019/6/6.
//  Copyright © 2019 3g. All rights reserved.
//

#import "OnState.h"

@implementation OnState

- (void)nextChannel{
    NSLog(@"下一个频道");
}
- (void)preChannel{
    NSLog(@"上一个频道");
}
- (void)turnUp{
    NSLog(@"调高音量");
}
- (void)turnDown{
    NSLog(@"调低音量");
}



@end
